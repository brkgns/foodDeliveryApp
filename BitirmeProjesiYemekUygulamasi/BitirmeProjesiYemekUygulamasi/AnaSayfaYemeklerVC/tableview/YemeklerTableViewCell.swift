//
//  YemeklerTableViewCell.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 6.09.2022.
//

import UIKit
protocol hucreProtocol {
    func buttonTıklandi(indexPath:IndexPath) //1
}

class YemeklerTableViewCell: UITableViewCell {
    @IBOutlet weak var yemekResimImageView: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var hucreArkaplan: UIView!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
    }
    
    
}
