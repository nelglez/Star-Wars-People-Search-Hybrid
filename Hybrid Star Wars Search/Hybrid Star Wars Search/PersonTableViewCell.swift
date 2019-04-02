//
//  PersonTableViewCell.swift
//  Hybrid Star Wars Search
//
//  Created by Nelson Gonzalez on 4/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    private func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        heightLabel.text = "\(person.height / 100)m"
        birthYearLabel.text = person.birthYear
        eyeColorLabel.text = person.eyeColor
    }
    
    @objc var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!


}
