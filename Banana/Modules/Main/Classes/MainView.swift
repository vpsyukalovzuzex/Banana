//
// MainView.swift
//

import UIKit

class MainView: UIViewController, MainViewProtocol, MainInputViewProtocol {
    
    // MARK: - MainViewProtocol
    
    var presenter: MainOutputViewProtocol?
    
    // MARK: - MainInputViewProtocol
    
    var caption: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    func startLoading() {
        button.isEnabled = false
        indicatorView.startAnimating()
    }
    
    func stopLoading() {
        button.isEnabled = true
        indicatorView.stopAnimating()
    }
    
    func showError(_ error: Error) {
        let alertController = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Private let
    
    private let label = UILabel()
    
    private let button = UIButton()
    
    private let indicatorView = UIActivityIndicatorView()
    
    // MARK: - Override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    // MARK: - Private func
    
    private func setupUi() {
        label.translatesAutoresizingMaskIntoConstraints = false
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Bananas?", for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.hidesWhenStopped = true
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(indicatorView)
        view.addConstraint(
            NSLayoutConstraint(
                item: view!,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: label,
                attribute: .centerX,
                multiplier: 1.0,
                constant: 0.0
            )
        )
        view.addConstraint(
            NSLayoutConstraint(
                item: view!,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: label,
                attribute: .centerY,
                multiplier: 1.0,
                constant: 0.0
            )
        )
        view.addConstraint(
            NSLayoutConstraint(
                item: button,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: label,
                attribute: .centerX,
                multiplier: 1.0,
                constant: 0.0
            )
        )
        view.addConstraint(
            NSLayoutConstraint(
                item: button,
                attribute: .top,
                relatedBy: .equal,
                toItem: label,
                attribute: .bottom,
                multiplier: 1.0,
                constant: 32.0
            )
        )
        view.addConstraint(
            NSLayoutConstraint(
                item: button,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: indicatorView,
                attribute: .centerY,
                multiplier: 1.0,
                constant: 0.0
            )
        )
        view.addConstraint(
            NSLayoutConstraint(
                item: button,
                attribute: .right,
                relatedBy: .equal,
                toItem: indicatorView,
                attribute: .left,
                multiplier: 1.0,
                constant: -16.0
            )
        )
        caption = "Press button"
    }
    
    // MARK: - @objc private func
    
    @objc
    private func buttonAction(_ sender: UIButton) {
        presenter?.didTouchButton()
    }
}
