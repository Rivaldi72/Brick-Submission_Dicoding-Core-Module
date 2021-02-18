//
//  File.swift
//  
//
//  Created by Rivaldi Aliando on 18/02/21.
//

import Foundation
import Combine
 
public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
