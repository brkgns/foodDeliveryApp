//
//  YemeklerDetayProtocol.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 7.09.2022.
//

import Foundation
//AnaProtokoller
protocol ViewToPresenterYemeklerDetayProtocol {
    var yemekDetayInteractor:PresenterToInteractorYemeklerDetayProtocol? {get set}
    var yemekDetayView:PresenterToViewYemeklerDetayProtocol? {get set}
    
    func ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)

}

protocol PresenterToInteractorYemeklerDetayProtocol {
    var yemekDetayPresenter:InteractorToPresenterYemeklerDetayProtocol? {get set}
    
    func yemekEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)
}

//TaşıyıcıProtokoller
protocol InteractorToPresenterYemeklerDetayProtocol {
    func presenteraVeriGönder(sepetteki_yemekler:Array<Sepetteki_Yemekler>)
    
}

protocol PresenterToViewYemeklerDetayProtocol {
    func vieweVeriGönder(sepetteki_yemekler:Array<Sepetteki_Yemekler>)

}

//Router
protocol PresenterToRouterYemeklerDetayProtocol {
    
    static func createModule(ref:YemeklerDetayVC)
}
