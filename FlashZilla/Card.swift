//
//  Card.swift
//  FlashZilla
//
//  Created by Weerawut Chaiyasomboon on 18/11/2567 BE.
//

import Foundation

struct Card: Codable{
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
