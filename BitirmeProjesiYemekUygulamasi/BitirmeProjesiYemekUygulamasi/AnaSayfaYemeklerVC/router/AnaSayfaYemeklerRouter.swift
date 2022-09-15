//
//  AnaSayfaYemeklerRouter.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 8.09.2022.
//

import Foundation

class AnaSayfaYemeklerRouter:PresenterToRouterAnaSayfaYemeklerProtocol {
    static func createModule(ref: AnaSayfaYemeklerVC) {
        let presenter = AnaSayfaYemeklerPresenter()
        //view
        ref.AnaSayfaYemeklerPresenterNesnesi = presenter
        //presenter
        
        ref.AnaSayfaYemeklerPresenterNesnesi?.AnaSayfaYemeklerInteractor = AnaSayfaYemeklerInteractor()
        ref.AnaSayfaYemeklerPresenterNesnesi?.AnaSayfaYemeklerView = ref
        
        //Interactor
        ref.AnaSayfaYemeklerPresenterNesnesi?.AnaSayfaYemeklerInteractor?.AnaSayfaYemeklerPresenter = presenter
    }
}
