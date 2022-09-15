//
//  AnaSayfaYemeklerInteractor.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 8.09.2022.
//

import Foundation
import Alamofire
import Kingfisher

class AnaSayfaYemeklerInteractor:PresenterToInteractorAnaSayfaYemeklerProtocol {
    
    var AnaSayfaYemeklerPresenter: InteractorToPresenterAnaSayfaYemeklerProtocol?
    
    func tumYemekleriAl() {
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(yemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler {
                        self.AnaSayfaYemeklerPresenter?.presenteraVeriGönder(yemeklerListesi: liste)
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        } .resume()
        
    }
    func yemekAra(aramaKelimesi: String) {
        let params:Parameters = ["yemek_adi":aramaKelimesi]
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(yemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler {
                        self.AnaSayfaYemeklerPresenter?.presenteraVeriGönder(yemeklerListesi: liste)
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
      
    }
    
}
