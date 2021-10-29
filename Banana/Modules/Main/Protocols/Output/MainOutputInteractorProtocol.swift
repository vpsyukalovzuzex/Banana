//
// MainOutputInteractorProtocol.swift
//

import Foundation

protocol MainOutputInteractorProtocol: AnyObject {
    
    // Add output functions.
    
    func didGetCount(_ count: Int)
    
    func didStartFetching()
    func didStopFetching()
    
    func didCatchError(_ error: Error)
}
