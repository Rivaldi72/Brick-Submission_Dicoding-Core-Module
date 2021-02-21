//
//  File.swift
//  
//
//  Created by Rivaldi Aliando on 18/02/21.
//

import Foundation
import RxSwift

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> Observable<[Response]>
    func add(from games: [Response]) -> Observable<Bool>
    func get(id: String) -> Observable<[Response]>
    func update(id: Int, entity: Response) -> Observable<Bool>

}
