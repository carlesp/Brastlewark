//
//  GnomesRepositoryTest.swift
//  BrastlewarkTests
//
//  Created by Carles Garcia Puigardeu on 14/6/22.
//

import XCTest
@testable import Brastlewark

class GnomesRepositoryTest: XCTestCase {
    var mockApiManager: MockApiManager!
    var sut: DefaultGnomesRepository!
    
    override func setUp() {
        mockApiManager = MockApiManager()
        sut = DefaultGnomesRepository(apiMananger: mockApiManager)
    }
    
    func test_get_gnomes() throws {
        let mockGnome = GnomesTO(id: 1, name: "Name", thumbnail: "http://test.dev", age: 1, weight: 1.1, height: 1.1, hair_color: "Color", professions: ["Profession"], friends: ["Friend"])
        let mockResponse = ResponseTO(data: [mockGnome])
        
        // given
        mockApiManager.getGnomes.result = .success(mockResponse)
        
        // when
        let expectation = expectation(description: "Gnomes result")
        var result = [Gnome]()
        _ = sut.getGnomes(completion: { response in
            if case .success(let value) = response {
                result = value
            }
            expectation.fulfill()
        })
        waitForExpectations(timeout: 1, handler: nil)
        
        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(result.count, mockResponse.data.count)
    }
}

