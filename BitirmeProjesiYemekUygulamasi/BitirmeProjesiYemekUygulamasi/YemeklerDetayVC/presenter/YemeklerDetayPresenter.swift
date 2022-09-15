//
//  YemeklerDetayPresenter.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 7.09.2022.
//

import Foundation

class YemeklerDetayPresenter:ViewToPresenterYemeklerDetayProtocol {
    
    var yemekDetayInteractor: PresenterToInteractorYemeklerDetayProtocol?
    var yemekDetayView: PresenterToViewYemeklerDetayProtocol?
    
func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        yemekDetayInteractor?.yemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
        
    }
}
extension YemeklerDetayPresenter:InteractorToPresenterYemeklerDetayProtocol {
    func presenteraVeriGönder(sepetteki_yemekler: Array<Sepetteki_Yemekler>) {
        yemekDetayView?.vieweVeriGönder(sepetteki_yemekler: sepetteki_yemekler)
    }
}
