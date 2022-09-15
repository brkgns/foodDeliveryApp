//
//  YemeklerDetayVC.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 6.09.2022.
//

import UIKit
import Alamofire
import Kingfisher

class YemeklerDetayVC: UIViewController {
    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var lblFiyat: UILabel!

    var yemek:Yemekler?
    var yemekListe:Sepetteki_Yemekler?

    var yemekDetayPresenterNesnesi:ViewToPresenterYemeklerDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YemekDetayRouter.createModule(ref: self)
        
        if let y = yemek {
            self.navigationItem.title = y.yemek_adi!
            imgeView.image = UIImage(named: y.yemek_resim_adi!)
            lblFiyat.text = "\(y.yemek_fiyat!) ₺"
        }

        let yemekResim = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek?.yemek_resim_adi! ?? "")")
        imgeView.kf.setImage(with: yemekResim)
    }
    
    @IBAction func miktarStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func btnSepeteEkle(_ sender: Any) {
        yemekDetayPresenterNesnesi?.ekle(yemek_adi: yemek!.yemek_adi!, yemek_resim_adi: yemek!.yemek_resim_adi!, yemek_fiyat: yemek!.yemek_fiyat!, yemek_siparis_adet:"1", kullanici_adi: "berkay_gunes")

    }
    
    @IBAction func btnSepetim(_ sender: Any) {
        
    }
    
    
   

}

