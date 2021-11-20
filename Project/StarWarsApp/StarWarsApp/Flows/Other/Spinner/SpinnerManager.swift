//
//  SpinnerManager.swift
//  StarWarsApp
//
//  Created by Aleksandr Fetisov on 06.11.2021.
//

import UIKit

class SpinnerManager: UIViewController {

    private let spinner = SpinnerViewController()

    var isLoading = false {
        didSet {
            guard oldValue != isLoading else { return }
            showSpinner(isShown: isLoading)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        spinner.view.frame = view.frame
    }

    private func showSpinner(isShown: Bool) {
        if isShown {
            addChild(spinner)
            view.addSubview(spinner.view)
            spinner.didMove(toParent: self)
        } else {
            spinner.willMove(toParent: nil)
            spinner.view.removeFromSuperview()
            spinner.removeFromParent()
        }
    }
}
