//
//  PlatformTests.swift
//  FreeGamesTests
//
//  Created by Nikolas Cardoso de Oliveira on 18/08/22.
//

import XCTest
@testable import FreeGames

class PlatformTests: XCTestCase {
    
    func test_withPlatform_whenHasType_shouldReturnRightNameSuccessfully() throws {
        let platformPc: Platform = .pc
        let platformWeb: Platform = .webBrowser
        let platformBoth: Platform = .both
        
        XCTAssertEqual(platformPc.name, Strings.platformPcName())
        XCTAssertEqual(platformWeb.name, Strings.platformWebBrowserName())
        XCTAssertEqual(platformBoth.name, Strings.platformBothName())
    }
    
    func test_withPlatform_whenHasType_shouldReturnRightIconNameSuccessfully() throws {
        let platformPc: Platform = .pc
        let platformWeb: Platform = .webBrowser
        let platformBoth: Platform = .both
        
        XCTAssertEqual(platformPc.iconName, Strings.platformPcIcon())
        XCTAssertEqual(platformWeb.iconName, Strings.platformWebBrowserIcon())
        XCTAssertEqual(platformBoth.iconName, Strings.platformBothIcon())
    }
    
}
