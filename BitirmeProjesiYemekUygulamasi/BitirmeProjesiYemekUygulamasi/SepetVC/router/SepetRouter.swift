//
//  SepetRouter.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 13.09.2022.
//

import Foundation
class SepetRouter:PresenterToRouterSepetProtocol{
    static func createModule(ref: SepetVC) {
        let presenter = SepetPresenter()
        //view
        ref.SepetPresenterNesnesi = presenter
        
        //Presenter
        ref.SepetPresenterNesnesi?.SepetInteractor = SepetInteractor()
        ref.SepetPresenterNesnesi?.SepetView = ref
        
        //Interactor
        ref.SepetPresenterNesnesi?.SepetInteractor?.SepetPresenter = presenter
    }
}

