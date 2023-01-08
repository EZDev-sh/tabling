//
//  RestaurantCell.swift
//  Homework
//
//  Created by 조재훈 on 2023/01/08.
//

import UIKit
import Kingfisher

@IBDesignable
class RestaurantCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var classification: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var etc: UILabel!
    @IBOutlet weak var watingBK: UIView!
    @IBOutlet weak var watingLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func bind(_ model: Restaurant) {
        thumbnail.kf.setImage(with: URL(string: model.thumbnail))
        classification.text = model.classification
        name.text = model.restaurantName
        rating.text = model.getGrade()
        address.text = model.summaryAddress
        
        etc.isHidden = false
        watingBK.isHidden = false
        
        if model.isQuickBooking {
            etc.text = "즉시예약"
            watingBK.isHidden = true
        }
        else if model.isRemoteWaiting {
            etc.text = "원격줄서기"
        }
        else {
            etc.isHidden = true
        }
        watingLabel.text = model.getWatingTeam()
        
        
        
        layoutIfNeeded()
        
    }
}
