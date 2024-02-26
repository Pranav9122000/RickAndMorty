//
//  RMService.swift
//  RickAndMorty
//
//  Created by Kulkarni, Pranav on 26/02/24.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() { }
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
