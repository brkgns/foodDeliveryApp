//
//  YemekDetayRouter.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 9.09.2022.
//

import Foundation
class YemekDetayRouter:PresenterToRouterYemeklerDetayProtocol{
    static func createModule(ref: YemeklerDetayVC) {
        
        let presenter = YemeklerDetayPresenter()
        
        ref.yemekDetayPresenterNesnesi = presenter
        
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = YemeklerDetayInteractor()
        
        ref.yemekDetayPresenterNesnesi?.yemekDetayView = ref as? PresenterToViewYemeklerDetayProtocol
        
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor?.yemekDetayPresenter = presenter
        
    }
}
