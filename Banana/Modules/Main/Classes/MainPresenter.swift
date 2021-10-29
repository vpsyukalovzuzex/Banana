//
// MainPresenter.swift
//

import Foundation

class MainPresenter: MainPresenterProtocol, MainOutputViewProtocol, MainOutputInteractorProtocol {
    
    // MARK: - MainPresenterProtocol
    
    var view: MainInputViewProtocol?
    
    var interactor: MainInputInteractorProtocol?
    
    var router: MainInputRouterProtocol?
    
    // MARK: - MainOutputViewProtocol
    
    // Implement protocol.
    
    func didTouchButton() {
        interactor?.getCount()
    }
    
    // MARK: - MainOutputInteractorProtocol
    
    // Implement protocol.
    
    func didGetCount(_ count: Int) {
        view?.caption = "Bananas = \(count)"
    }
    
    func didStartFetching() {
        view?.startLoading()
    }
    
    func didStopFetching() {
        view?.stopLoading()
    }
    
    func didCatchError(_ error: Error) {
        view?.showError(error)
    }
}
