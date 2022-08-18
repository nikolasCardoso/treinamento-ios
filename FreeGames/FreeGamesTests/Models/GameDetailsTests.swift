//
//  GameDetailsTests.swift
//  FreeGamesTests
//
//  Created by Nikolas Cardoso de Oliveira on 18/08/22.
//

import XCTest
@testable import FreeGames

class GameDetailsTests: XCTestCase {
    
    func test_withGameDetails_whenHasSystemRequirements_shouldReturnTrue() throws {
        let minSysReq = MinimumSystemRequirements(os: "os test", processor: "processor test", storage: "storage test", memory: "memory test", graphics: "graphics test")
        let game = GameDetails(id: 1, title: "Test", description: "Test dec", image: "image test", url: "url test", genre: "genre test", platform: .webBrowser, developer: "dev test", publisher: "pub test", releaseDate: "test date", minSysReq: minSysReq)
        
        XCTAssertTrue(game.hasSystemRequirements)
    }
    
    func test_withGameDetails_whenHasNoSystemRequirements_shouldReturnFalse() throws {
        let game = GameDetails(id: 1, title: "Test", description: "Test dec", image: "image test", url: "url test", genre: "genre test", platform: .webBrowser, developer: "dev test", publisher: "pub test", releaseDate: "test date", minSysReq: nil)
        
        XCTAssertFalse(game.hasSystemRequirements)
    }
    
}
