//
//  QuestionHeader.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 10.10.24.
//

import UIKit

class QuestionHeader: UICollectionReusableView {
    @IBOutlet private weak var questionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        questionLabel.layer.borderWidth = 1
        questionLabel.layer.cornerRadius = 20
        questionLabel.backgroundColor = .clear
        questionLabel.layer.backgroundColor = UIColor.white.cgColor
        
        
    }
    
    func configureView(model: Question) {
        questionLabel.text = model.title
    }
}
