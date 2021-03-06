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
    func add(entities: [Response]) -> Observable<Bool>
    func get(id: Int) -> Observable<Response>
    func update(id: Int) -> Observable<Bool>
    func addToFavorite(game: Response)

}
