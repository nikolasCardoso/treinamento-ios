//
//  GameDetails+MapperTests.swift
//  FreeGamesTests
//
//  Created by Nikolas Cardoso de Oliveira on 18/08/22.
//

import XCTest
@testable import FreeGames

class GameDetailsPlusMapperTests: XCTestCase {
    
    func test_withGameDetails_whenMappingToGamePlayLater_shouldConvertSuccessfully() throws {
        let game = GameDetails(id: 1, title: "Test", description: "Test dec", image: "image test", url: "url test", genre: "genre test", platform: .webBrowser, developer: "dev test", publisher: "pub test", releaseDate: "test date", minSysReq: nil)
        
        let gamePlayLater = game.toGamePlayLater()
        
        XCTAssertEqual(gamePlayLater.id, game.id)
        XCTAssertEqual(gamePlayLater.title, game.title)
    }
    
}
