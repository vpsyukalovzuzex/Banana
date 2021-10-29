//
// MainPresenterProtocol.swift
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    
    var view: MainInputViewProtocol? { get set }
    
    var interactor: MainInputInteractorProtocol? { get set }
    
    var router: MainInputRouterProtocol? { get set }
}
