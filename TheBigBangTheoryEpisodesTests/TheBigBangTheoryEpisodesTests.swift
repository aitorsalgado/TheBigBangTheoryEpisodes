//
//  TheBigBangTheoryEpisodesTests.swift
//  TheBigBangTheoryEpisodesTests
//
//  Created by Aitor Salgado on 27/1/23.
//

import XCTest
@testable import TheBigBangTheoryEpisodes

final class TheBigBangTheoryEpisodesTests: XCTestCase {
    let persitance = ModelPersistance()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadEpisodes() throws {
        let episodes = persitance.loadEpisodes()
        XCTAssertEqual(episodes.count, 279)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
