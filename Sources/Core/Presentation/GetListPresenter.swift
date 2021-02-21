//
//  File.swift
//  
//
//  Created by Rivaldi Aliando on 18/02/21.
//

import SwiftUI
import RxSwift

public class GetListPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == [Response] {
    
    private var disposeBag = DisposeBag()
    
    private let _useCase: Interactor
    
    @Published public var list: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func getList(request: Request?) {
        isLoading = true
        _useCase.execute(request: request)
            .observeOn(MainScheduler.instance)
            .subscribe { result in
                self.list = list
            } onError: { error in
                self.errorMessage = error.localizedDescription
                self.isError = true
                self.isLoading = false
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
}
