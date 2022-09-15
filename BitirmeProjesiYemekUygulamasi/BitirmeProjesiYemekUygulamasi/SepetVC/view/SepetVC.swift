//
//  SepetVC.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 7.09.2022.
//

import UIKit
import Alamofire
import Kingfisher

class SepetVC: UIViewController {
    var sepetListe = [Sepetteki_Yemekler]()
    var toplam = 0

    var SepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
    @IBOutlet weak var sepetTableView: UITableView!
    @IBOutlet weak var lblToplam: UILabel!
    @IBOutlet weak var lblToplamFiyat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        SepetRouter.createModule(ref: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        SepetPresenterNesnesi?.getir(kullanici_adi: "berkay_gunes")
    }
    @IBAction func buttonOnayla(_ sender: Any) {
        
    }
    
}
extension SepetVC:PresenterToViewSepetProtocol{
    func vieweVeriGönder(sepetteki_yemekler: Array<Sepetteki_Yemekler>) {
        
            self.sepetListe = sepetteki_yemekler
        
            toplam = 0
            if !sepetteki_yemekler.isEmpty {
                for yemek in sepetteki_yemekler {
                    if let Price = yemek.yemek_fiyat, let Count = yemek.yemek_siparis_adet, let p = Int(Price), let c = Int(Count) {
                        toplam += p * c
                        lblToplamFiyat.text = "\(toplam) ₺"
                    }
                }
            }else{
                let toplam:Int = 0
                self.lblToplamFiyat.text = "\(toplam) ₺"
            }
        
        DispatchQueue.main.async {

        self.sepetTableView.reloadData()
            print(self.toplam)
        }
        
    }
}

extension SepetVC:UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sepetListe.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = sepetListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        
        let yemekResim = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
        hucre.imageYemek.kf.setImage(with: yemekResim)
        hucre.lblYemekAdi.text = yemek.yemek_adi
        hucre.lblYemekFiyati.text = "\(yemek.yemek_fiyat!) ₺"
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaPlan.layer.cornerRadius = 10.0
        hucre.selectionStyle = .none
            return hucre
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { [self]
            (UIContextualAction,view,bool) in
            
            let yemek = self.sepetListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ [self] action
                in
                
                self.SepetPresenterNesnesi?.sil(sepet_yemek_id: yemek.sepet_yemek_id!, kullanici_adi:"berkay_gunes")
                
                }
            alert.addAction(evetAction)
            
            self.present(alert, animated:true)
        }
        return UISwipeActionsConfiguration(actions: [silAction] )

}

    
}


