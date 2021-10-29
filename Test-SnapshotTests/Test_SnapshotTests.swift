//
//  Test_SnapshotTests.swift
//  Test-SnapshotTests
//
//  Created by Mohammed Shahid on 29/10/21.
//

import XCTest
@testable import Test_Snapshot
import SnapshotTesting

class Test_SnapshotTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let sut = ViewController()
        assertSnapshot(matching: sut,
                       as: .image(on: .iPhoneSe))
    }
}
