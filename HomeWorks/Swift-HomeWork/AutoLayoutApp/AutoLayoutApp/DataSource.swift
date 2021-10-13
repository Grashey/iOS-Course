//
//  DataSource.swift
//  AutoLayoutApp
//
//  Created by Aleksandr Fetisov on 12.10.2021.
//

import UIKit

class DataSource: NSObject {
    
    private let tableView: UITableView
    private let collectionView: UICollectionView
    var movieDescriptionDelegate: MovieDescriptionDelegate

    init(tableView: UITableView, collectionView: UICollectionView, movieDescriptionDelegate: MovieDescriptionDelegate) {
        self.tableView = tableView
        self.collectionView = collectionView
        self.movieDescriptionDelegate = movieDescriptionDelegate
        super.init()
        tableView.dataSource = self
        tableView.reloadData()
        collectionView.dataSource = self
        collectionView.reloadData()
        setDescription(item: .zero)
    }
    
    let genres = ["Анимэ", "Боевик", "Вестерн", "Детектив", "Драма", "Комедия", "Мистика", "Ужасы"]
    let colors: [UIColor] = [.yellow, .lightGray, .red, .green, .blue, .cyan, .magenta, .orange]
    var index: Int = 0
    
    private func setDescription(item: Int) {
        let random = Int.random(in: 10...20)
        var text = String()
        for _ in .zero...random {
            text.append(contentsOf: "\(genres[index])\(item) ")
        }
        movieDescriptionDelegate.configureLabel(text: text, color: colors[index])
    }
}

extension DataSource: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableViewCell.description()) as? GenreTableViewCell else { return UITableViewCell() }
        cell.configureWith(color: colors[indexPath.row], text: genres[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        collectionView.selectItem(at: IndexPath(item: .zero, section: .zero), animated: false, scrollPosition: .left)
        setDescription(item: .zero)
        collectionView.reloadData()
    }
}

extension DataSource: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.description(), for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        cell.configureWith(color: colors[index], text: "\(genres[index])\(indexPath.item)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset: CGFloat = 10
        let minLineSpacing = UICollectionViewFlowLayout().minimumLineSpacing
        let height = collectionView.visibleSize.height
        let width = collectionView.visibleSize.width - minLineSpacing - inset
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        setDescription(item: indexPath.item)
    }
}
