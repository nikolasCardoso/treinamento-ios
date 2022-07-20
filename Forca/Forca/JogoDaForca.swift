//
//  JogoDaForca.swift
//  Forca
//
//  Created by Nikolas Cardoso de Oliveira on 20/07/22.
//

import Foundation

class JogoDaForca {
    let palavra: String
    let dica: String
    
    private(set) var maskedWord: String
    private(set) var lastTry: [String] = []
    private(set) var erros: Int  = 0
    private(set) var gameSituation: GameState = .going
    
    init(palavra: String, dica: String){
        self.palavra = palavra.uppercased()
        self.dica  = dica
        
        self.maskedWord = palavra.map { _ in "_" }.joined()
    }
    
    func tryLetter(letter: String){
        guard let comparableLetter = letter.first?.comparable else {
            return
        }
        
        guard !lastTry.contains(comparableLetter) else  {
            return
        }
        
        lastTry.append(comparableLetter)
        guard palavra.contains(comparableLetter) else {
            erros += 1
            
            if erros > 5 {
                gameSituation = .lose
            }
            
            return 
        }
        
        maskedWord = swap(letter: comparableLetter, on: maskedWord, original: palavra)
        
        if maskedWord.comparable == palavra {
            gameSituation = .won
        }
    }
}

extension JogoDaForca  {
    class func aleatorio() -> JogoDaForca {
        guard let item = palavras.randomElement() else {
            return .init(palavra: "abelha", dica: "inseto")
        }
        
        return .init(palavra: item.key, dica: item.value)
    }
}

enum GameState {
    case won, lose, going
}

let palavras = [
    "abelha": "inseto",
    "formiga": "inseto",
    "macaco": "animal",
    "cabra": "animal"
]
