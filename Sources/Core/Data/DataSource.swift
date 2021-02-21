//
//  File.swift
//  
//
//  Created by Rivaldi Aliando on 18/02/21.
//

import Foundation
import RxSwift
 
public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> Observable<[Response]>
}
