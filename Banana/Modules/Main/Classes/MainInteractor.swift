//
// MainInteractor.swift
//

import Foundation

class MainInteractor: MainInteractorProtocol, MainInputInteractorProtocol {
    
    // MARK: - MainInteractorProtocol
    
    var presenter: MainOutputInteractorProtocol?
    
    // MARK: - MainInputInteractorProtocol
    
    // Implement protocol.
    
    func getCount() {
        guard let url = URL(string: "https://en.wikipedia.org/wiki/Banana") else {
            return
        }
        presenter?.didStartFetching()
        Service.fetchHtmlText(with: url) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let string):
                let count = string
                    .stripHtml()
                    .count(for: "banana")
                print(string
                        .stripHtml())
                self.presenter?.didGetCount(count)
            case .failure(let error):
                self.presenter?.didCatchError(error)
            }
            self.presenter?.didStopFetching()
        }
    }
}
