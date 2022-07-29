//
//  ForcaTests.swift
//  ForcaTests
//
//  Created by Nikolas Cardoso de Oliveira on 19/07/22.
//

import XCTest
@testable import Forca

class ForcaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_swap() {
        var mask = "____"
        let word = "mula"
        
        mask = swap(letter: "m", on: mask, original: word)
        XCTAssertEqual("m___", mask)
        
        mask = swap(letter: "u", on: mask, original: word)
        XCTAssertEqual("mu__", mask)
        
        mask = swap(letter: "x", on: mask, original: word)
        XCTAssertEqual("mu__", mask)
        
        mask = swap(letter: "l", on: mask, original: word)
        XCTAssertEqual("mul_", mask)
        
        mask = swap(letter: "a", on: mask, original: word)
        XCTAssertEqual("mula", mask)
    }

}
