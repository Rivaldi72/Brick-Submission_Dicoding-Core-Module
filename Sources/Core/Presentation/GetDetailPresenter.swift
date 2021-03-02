//
//  File.swift
//  
//
//  Created by Rivaldi Aliando on 02/03/21.
//

import SwiftUI
import RxSwift

public class GetDetailPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {
    
    private var disposeBag = DisposeBag()
    
    private let _useCase: Interactor
    
    @Published public var detailData: Response?
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(useCase: Interactor) {
        _useCase = useCase
    }
    
    public func getDetail(request: Request?) {
        isLoading = true
        _useCase.execute(request: request)
            .observeOn(MainScheduler.instance)
            .subscribe { data in
                self.detailData = data
            } onError: { error in
                self.errorMessage = error.localizedDescription
                self.isError = true
                self.isLoading = false
            } onCompleted: {
                self.isLoading = false
            }.disposed(by: disposeBag)
    }
}
