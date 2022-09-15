//
//  ViewController.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 3.09.2022.
//

import UIKit

class CreateAccountVC: UIViewController {
   
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var lblKullanıcıAdı: UILabel!
    @IBOutlet weak var lblSifre: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "Renk1")
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
       
        
    }
   
        
    @IBAction func btnLog(_ sender: Any) {
        performSegue(withIdentifier: "toAnasayfa", sender: nil) 

    }
    
    @IBAction func btnSign(_ sender: Any) {
        performSegue(withIdentifier: "toKayıt", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toKayıt"{
            let gidilecekVC = segue.destination as! UyelikVC
            gidilecekVC.delegate = self
        }
    }

}

extension CreateAccountVC:KayitToViewProtocol{
    func veriGönder(email: String, kullanici_adi: String, sifre: String) {
        lblMail.text = email
        lblKullanıcıAdı.text = kullanici_adi
        lblSifre.text = sifre
    }
}
