//
//  TriviaCode.swift
//  Trivia
//
//  Created by Darian Lee on 10/1/23.
//

import Foundation
struct TriviaCode {
  let question: QuestionCode
  let questionNum: Int
  let choice1: String
  let choice2: String
  let choice3: String
  let choice4: String
  let correct: String
  let restartVal: String
  let contestVal: String
  //let weatherCode: WeatherCode
}

enum QuestionCode {
    case history
    case sports
    case film
    case done
    
    
    var category: String {
        switch self {
        case .history:
            return "History"
        case .sports:
            return "Sports"
        case .film:
            return "Film"
        case .done:
            return "GREAT WORK!"
        }
    }
    
    var description: String {
        switch self {
        case .history:
            return "Who was the first leader of Russia after the collapse of the soviet union"
        case .sports:
            return "In which country did a state sponsered doping scandal take place from 1960-1980?"
        case .film:
            return "The following is one of the highest grossing films made in the Soviet Union"
        case .done:
            return "Score:"
            
            
        }
    }
    
    
    var choices: (String, String, String, String) {
        switch self {
        case .history:
            return ("Boris Yeltsin", "Joseph Stalin", "Vladimir Putin", "Dmitry Medvedev")
        case .sports:
            return ("USSR", "East Germany", "Cuba", "Angola")
        case .film:
            return ("The Factory's Heart", "Bread and Roses", "Kolkhoz's Daughter", "Moscow does not Believe in Tears")
        case .done:
            return ("", "", "", "")
        }
    }
    
    var correctChoice: String {
        switch self {
        case .history:
            return "Boris Yeltsin"
        case .sports:
            return "East Germany"
        case .film:
            return "Moscow does not Believe in Tears"
        case .done:
            return ""
        }
    }
    var restartVal: String {
        switch self {
        case .history:
            return ""
        case .sports:
            return ""
        case .film:
            return ""
        case .done:
            return "Restart"
        }
    }
    var contestVal: String {
        switch self {
        case .history:
            return ""
        case .sports:
            return ""
        case .film:
            return ""
        case .done:
            return "Contest Score"
        }
    }
}


