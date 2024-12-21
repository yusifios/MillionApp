//
//  QuizModel.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 09.10.24.
//

import Foundation
import UIKit


import Foundation
struct Question {
    let title: String
    var answer: [Answer]
}

struct Answer {
    let title: String
    let correct: Bool
    var color: UIColor = .clear
}
