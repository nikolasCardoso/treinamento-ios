//
//  JogoDaForcaTests.swift
//  ForcaTests
//
//  Created by Nikolas Cardoso de Oliveira on 21/07/22.
//

import Foundation
import XCTest
@testable import Forca

class JogoDaForcaTests: XCTestCase {
    
//    SYSTEM UNDER TEST
    var sut: JogoDaForca?
    
    override func setUp() {
        sut = .init(palavra: "abelha", dica: "inseto")
    }
    
    func test_try_withTwoLettersRight_whenTryingAnotherRightLetter_shouldNotHaveAnyErrors() throws{
//        Given
        let sut = try XCTUnwrap(sut)
        sut.tryLetter(letter: "a")
        sut.tryLetter(letter: "b")
        
//        When
        sut.tryLetter(letter: "e")
        
//        Then
        XCTAssertEqual(sut.erros, 0)
    }
    
    func test_try_withTwoLettersRight_whenTryingAWrongLetter_shouldHaveOneError() throws {
    //        Given
            let sut = try XCTUnwrap(sut)
            sut.tryLetter(letter: "a")
            sut.tryLetter(letter: "b")
            
    //        When
            sut.tryLetter(letter: "x")
            
    //        Then
            XCTAssertEqual(sut.erros, 1)
    }
    
    func test_emptyLetter() throws {
        let sut = try XCTUnwrap(sut)
        sut.tryLetter(letter: "")
        
        XCTAssertEqual(sut.erros, 0)
    }
}
