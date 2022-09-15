//
//  UyelikVC.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 14.09.2022.
//

import UIKit

class UyelikVC: UIViewController {

    @IBOutlet weak var textfieldMail: UITextField!
    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldSifre: UITextField!
    
    var delegate:KayitToViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func buttonKayit(_ sender: Any) {
        if let tm = textfieldMail.text, let tu = textfieldUserName.text , let ts = textfieldSifre.text{
        delegate?.veriGönder(email: tm, kullanici_adi: tu, sifre: ts)
        }
        
    }

}
