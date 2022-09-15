//
//  SepetTableViewCell.swift
//  BitirmeProjesiYemekUygulamasi
//
//  Created by Berkay Güneş on 13.09.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {
    @IBOutlet weak var lblYemekAdi: UILabel!
    @IBOutlet weak var lblYemekFiyati: UILabel!
    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var imageYemek: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
