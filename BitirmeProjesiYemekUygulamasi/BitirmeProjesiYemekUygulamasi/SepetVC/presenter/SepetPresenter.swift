//
//  SepetPresenter.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 13.09.2022.
//

import Foundation
class SepetPresenter:ViewToPresenterSepetProtocol{
    
    var SepetInteractor: PresenterToInteractorSepetProtocol?
    var SepetView: PresenterToViewSepetProtocol?
    
    func getir(kullanici_adi: String) {
        SepetInteractor?.sepetiGetir(kullanici_adi: kullanici_adi)
    }
    func sil(sepet_yemek_id: String, kullanici_adi: String) {
        SepetInteractor?.sepetiSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    
}
extension SepetPresenter: InteractorToPresenterSepetProtocol{
    func presenteraVeriGönder(sepetteki_yemekler: Array<Sepetteki_Yemekler>) {
        SepetView?.vieweVeriGönder(sepetteki_yemekler: sepetteki_yemekler)
    }
}
