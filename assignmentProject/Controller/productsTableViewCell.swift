//
//  productsTableViewCell.swift
//  assignmentProject
//
//  Created by Navaneethkrishnan Manoj on 24/11/22.
//

import UIKit
import Kingfisher
class productsTableViewCell: UITableViewCell {

    @IBOutlet weak var prodIMG: UIImageView!
    @IBOutlet weak var prodLink: UITextView!
    @IBOutlet weak var prodPrice: UILabel!
    @IBOutlet weak var prodName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prodIMG.layer.cornerRadius = 10
        prodIMG.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func dataPass(row: Element){
        
        prodName.text = row.name
        prodPrice.text = String(row.priceSign!.rawValue ) + String(row.price! )
        prodLink.text = row.productLink
        let url = URL(string: String(row.imageLink))
        prodIMG.kf.setImage(with: url)
    }
    
}
