//
//  QuestionStruct.swift
//  QuizPLS
//
//  Created by apple on 25/11/19.
//  Copyright © 2019 Tinkercademy. All rights reserved.
//

import Foundation

enum OptionChoices {
    case one
    case two
    case three
    case four
}

struct Question {
    var questionStatement : String
    var firstChoice : String
    var secondChoice : String
    var thirdChoice : String
    var fourthChoice : String
    var correctChoice : OptionChoices
    var answeredCorrectly : Bool
}

