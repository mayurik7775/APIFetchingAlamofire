//
//  UserCell.swift
//  APIusingAlamofire
//
//  Created by Admin on 20/02/24.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblid: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lblstatus: UILabel!
    
    var eachuser: UserModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func userConfiguration(){
        let stauts = eachuser.getstautsandcolor()
        lblstatus.text = stauts.0
        backgroundColor = stauts.1
        if let id = eachuser.id{
            lblid.text = "ID : \(id)"
        }else{
            lblid.text = "No ID"
        }
       
    }
}
