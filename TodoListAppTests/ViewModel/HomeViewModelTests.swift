//
//  HomeViewModelTests.swift
//  HomeViewModelTests
//
//  Created by 逸唐陳 on 2023/8/2.
//

import XCTest
@testable import TodoListApp

final class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_request_post_success() {
        let repo = PostRepositoryImpl(client: MockAPIClientSuccess())
        sut = HomeViewModel(postRepository: repo)
        
        let exp = expectation(description: "succes")
        var post: Post? = nil
        
        sut.eventState = { state in
            switch state {
            case .data(let data):
                post = data
                exp.fulfill()
            case .loading:
                break
            case .error(_):
                break
            }
        }
        
        sut.getPost()
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error: \(error?.localizedDescription ?? "Timeout")")
            XCTAssertEqual(post?.id, 1)
        }
    }
    
    func test_request_post_failure() {
        let repo = PostRepositoryImpl(client: MockAPIClientFailure())
        sut = HomeViewModel(postRepository: repo)
        
        let exp = expectation(description: "failure")
        var expectedError: APIRequestError? = nil
        
        sut.eventState = { state in
            switch state {
            case .data(_):
                break
            case .loading:
                break
            case .error(let error):
                if let error = error as? APIRequestError {
                    expectedError = error
                }
                exp.fulfill()
                break
            }
        }
        
        sut.getPost()
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error: \(error?.localizedDescription ?? "Timeout")")
            XCTAssertEqual(expectedError, APIRequestError.requestFailed)
        }
    }
    
    func test_request_post_loading_state() {
        let repo = PostRepositoryImpl(client: MockAPIClientSuccess())
        sut = HomeViewModel(postRepository: repo)
        
        let exp = expectation(description: "loading test")
        var isLoading = false
        
        sut.eventState = { state in
            switch state {
            case .data(_):
                break
            case .loading:
                isLoading = true
                exp.fulfill()
            case .error(_):
                break
            }
        }
        
        sut.getPost()
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error: \(error?.localizedDescription ?? "Timeout")")
            XCTAssertTrue(isLoading)
        }
    }
}
