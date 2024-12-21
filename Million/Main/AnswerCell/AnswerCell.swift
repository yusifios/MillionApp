//
//  AnswerCell.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 10.10.24.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    @IBOutlet weak var answerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        answerLabel.layer.borderWidth = 1
        answerLabel.layer.cornerRadius = 20
    }

    func configureCell(model: Answer) {
        answerLabel.text = model.title
        answerLabel.backgroundColor = model.color
    }
}
