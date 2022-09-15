//
//  AnaSayfaYemeklerVC.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 5.09.2022.
//

import UIKit
import Kingfisher

class AnaSayfaYemeklerVC: UIViewController {
    @IBOutlet weak var yemeklerTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var yemeklerListe = [Yemekler]()
    
    var AnaSayfaYemeklerPresenterNesnesi:ViewToPresenterAnaSayfaYemeklerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "JustDelivery"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "Renk1")
        appearance.titleTextAttributes = [.foregroundColor:UIColor(named: "Renk2")!,.font: UIFont(name: "Marker Felt Thin", size: 25)!]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
     
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        searchBar.delegate = self
        yemeklerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
        AnaSayfaYemeklerRouter.createModule(ref: self)
        
    }
    
    @IBAction func buttonSepetim(_ sender: Any) {
        performSegue(withIdentifier: "toSepetVC", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        AnaSayfaYemeklerPresenterNesnesi?.yemekleriAl()
    }
}

extension AnaSayfaYemeklerVC:UITableViewDelegate,UITableViewDataSource{ //2
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemekHucre", for: indexPath) as! YemeklerTableViewCell
        
        let yemekResim = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
        
        hucre.yemekResimImageView.kf.setImage(with: yemekResim)
        
        hucre.yemekAdLabel.text = yemek.yemek_adi
        hucre.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaplan.layer.cornerRadius = 10.0
        
       
        
        hucre.selectionStyle = .none
        return hucre
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{

            if let y = sender as? Yemekler {
                let gidilecekVC = segue.destination as? YemeklerDetayVC
                gidilecekVC?.yemek = y
            }
        }
    }
}
extension AnaSayfaYemeklerVC:PresenterToViewAnaSayfaYemeklerProtocol {
    func vieweVeriGönder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()

        }
    }
  
}
extension AnaSayfaYemeklerVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        AnaSayfaYemeklerPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
    
}
