//
// MainInteractorProtocol.swift
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    
    var presenter: MainOutputInteractorProtocol? { get set }
}
