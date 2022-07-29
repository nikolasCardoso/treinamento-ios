//
//  JogoDaMemoriaa.swift
//  JogoDaMemoria
//
//  Created by Nikolas Cardoso de Oliveira on 22/07/22.
//

import Foundation

class JogoDaMemoria {
    var score: Int = 0
    var gameSituation: GameSituation = .going
    private(set) var tries: Int  = 0
    var lastTry: String?
    private(set) var currentTry: String?
    var lastTryIndex: Int?
    private(set) var cards: [Int: String] = [:]
    private var images: [String] = []
    
    init(){
        images = [
            "dwarf",
            "elf",
            "witch",
            "wizard",
            "knight"
        ]
        tries = 0
        randomizeCards()
    }
    
    func randomizeCards() {
        for index in 1...10{
            let randomImage = getRandomImage()
            cards[index] = randomImage
        }
    }
    
    func getRandomImage() -> String {
        guard let randomImage = images.randomElement() else {
            return ""
        }
        
        let valueCount = countRecurringImages(with: randomImage)
        
        if(valueCount == 1){
            if let index = images.firstIndex(of: randomImage){
                images.remove(at: index)
            }
        }
        
        return randomImage
    }
    
    private func countRecurringImages(with randomImage: String) -> Int {
        let count = cards.values.reduce(0, { count, image in
            if(image == randomImage){
                return count+1
            }
             return count
        })
        
        return count
    }
    
    func verifyTry(with cardTag: Int) -> Bool {
        currentTry = cards[cardTag]
        if lastTry == nil {
            lastTry = cards[cardTag]
            lastTryIndex = cardTag
        } else {
            if(currentTry != lastTry){
                tries += 1
                return false
            } else {
                tries += 1
                score += 1
                verifyGameWon()
                lastTry = nil
                lastTryIndex = nil
            }
        }
        
        return true
    }
    
    func verifyGameWon() {
        if(score == 5) {
            gameSituation = .won
        }
    }
}

enum GameSituation {
    case won, going
}
