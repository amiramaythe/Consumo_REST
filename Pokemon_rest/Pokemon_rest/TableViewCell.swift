//
//  TableViewCell.swift
//  Pokemon_rest
//
//  Created by Amira Maythe Vasquez on 20/02/2020.
//  Copyright © 2020 desafio. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func initCell (title: String){
        name.text = title
    }

}
