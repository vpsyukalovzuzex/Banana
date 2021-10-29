//
// MainInputViewProtocol.swift
//

import Foundation

protocol MainInputViewProtocol: AnyObject {
    
    // Add input functions.
    var caption: String? { set get }
    
    func startLoading()
    func stopLoading()
    
    func showError(_ error: Error)
}
