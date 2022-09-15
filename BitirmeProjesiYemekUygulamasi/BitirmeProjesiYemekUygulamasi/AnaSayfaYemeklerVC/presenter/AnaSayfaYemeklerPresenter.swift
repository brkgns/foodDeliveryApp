//
//  AnaSayfaYemeklerPresenter.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 8.09.2022.
//

import Foundation

class AnaSayfaYemeklerPresenter:ViewToPresenterAnaSayfaYemeklerProtocol {
    var AnaSayfaYemeklerInteractor: PresenterToInteractorAnaSayfaYemeklerProtocol?
    
    var AnaSayfaYemeklerView: PresenterToViewAnaSayfaYemeklerProtocol?
    
    func yemekleriAl() {
        AnaSayfaYemeklerInteractor?.tumYemekleriAl()
    }
    func ara(aramaKelimesi: String) {
        AnaSayfaYemeklerInteractor?.yemekAra(aramaKelimesi: aramaKelimesi)
    }

}

extension AnaSayfaYemeklerPresenter:InteractorToPresenterAnaSayfaYemeklerProtocol {
    func presenteraVeriGönder(yemeklerListesi: Array<Yemekler>) {
        AnaSayfaYemeklerView?.vieweVeriGönder(yemeklerListesi: yemeklerListesi)
    }
}
