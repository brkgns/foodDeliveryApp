//
//  AnaSayfaYemeklerProtocol.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 7.09.2022.
//

import Foundation
//Ana protokoller
protocol ViewToPresenterAnaSayfaYemeklerProtocol {
    var AnaSayfaYemeklerInteractor:PresenterToInteractorAnaSayfaYemeklerProtocol? {get set}
    var AnaSayfaYemeklerView:PresenterToViewAnaSayfaYemeklerProtocol? {get set}
    
    func yemekleriAl()
    func ara(aramaKelimesi:String)

}

protocol PresenterToInteractorAnaSayfaYemeklerProtocol {
    var AnaSayfaYemeklerPresenter:InteractorToPresenterAnaSayfaYemeklerProtocol? {get set}
    
    func tumYemekleriAl()
    func yemekAra(aramaKelimesi:String)

}
//Taşıyıcı protokoller
protocol InteractorToPresenterAnaSayfaYemeklerProtocol{
    func presenteraVeriGönder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToViewAnaSayfaYemeklerProtocol {
    func vieweVeriGönder(yemeklerListesi:Array<Yemekler>)

}


//Router
protocol PresenterToRouterAnaSayfaYemeklerProtocol {
    static func createModule(ref:AnaSayfaYemeklerVC)
}
