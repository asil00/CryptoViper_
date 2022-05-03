//
//  Presenter.swift
//  CryptoViper
//
//  Created by Asilcan Çetinkaya on 21.04.2022.
//

import Foundation


// Class Protocol
// Talks to Interactor Router View


enum NetworkError : Error {
    case networkFailed
    case parsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter? { get set }
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter : AnyPresenter {
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    /*
    init(){
        interactor?.downloadCrypto()
    }
     */
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
            case .success(let cryptos):
                view?.update(with: cryptos)
            case .failure(_):
                view?.update(with: "Try again later")
        }
    }
    
}
