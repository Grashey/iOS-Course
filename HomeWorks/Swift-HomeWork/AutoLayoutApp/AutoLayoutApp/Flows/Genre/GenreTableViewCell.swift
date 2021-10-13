//
//  GenreTableViewCell.swift
//  AutoLayoutApp
//
//  Created by Aleksandr Fetisov on 12.10.2021.
//

import UIKit

class GenreTableViewCell: UITableViewCell {
    
    let inset: CGFloat = 10
    
    lazy var iconView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func addSubviews() {
        contentView.addSubview(iconView)
        contentView.addSubview(label)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            iconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            iconView.heightAnchor.constraint(equalTo: iconView.widthAnchor),
            
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: inset/2),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
    
    func configureWith(color: UIColor, text: String) {
        self.iconView.backgroundColor = color
        self.label.text = text
    }
}
