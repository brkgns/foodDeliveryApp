//
//  SepetProtocol.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 7.09.2022.
//

import Foundation
//AnaProtocol
protocol ViewToPresenterSepetProtocol{
    var SepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var SepetView:PresenterToViewSepetProtocol? {get set}
    
    func getir(kullanici_adi:String)
    func sil(sepet_yemek_id:String,kullanici_adi:String)
    
}
protocol PresenterToInteractorSepetProtocol{
    var SepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func sepetiGetir(kullanici_adi:String)
    func sepetiSil(sepet_yemek_id:String,kullanici_adi:String)
}


//TaşıyıcıProtokol
protocol InteractorToPresenterSepetProtocol{
    func presenteraVeriGönder(sepetteki_yemekler:Array<Sepetteki_Yemekler>)
}
protocol PresenterToViewSepetProtocol{
    func vieweVeriGönder(sepetteki_yemekler:Array<Sepetteki_Yemekler>)

}
//Router
protocol PresenterToRouterSepetProtocol{
    static func createModule(ref:SepetVC)
}
