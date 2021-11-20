//
//  DetailTableViewCell.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 11.11.2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    private let inset: CGFloat = 10

    private lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(UIScrollView())

    private lazy var entityStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = inset
        $0.distribution = .fillProportionally
        $0.alignment = .leading
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        addSubviews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(entityStackView)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        entityStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            entityStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            entityStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            entityStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            entityStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            entityStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    func configure(models: [EntityShortViewModel], size: AvatarView.Size) {
        models.forEach { model in
            let view = AvatarView()
            guard let image = model.image else { return }
            view.configureWith(name: model.name, image: image, size: size)
            entityStackView.addArrangedSubview(view)
        }
    }

}
