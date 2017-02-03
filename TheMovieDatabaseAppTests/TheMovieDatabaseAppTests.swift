//
//  TheMovieDatabaseAppTests.swift
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 2/1/17.
//  Copyright © 2017 Kevin Farst. All rights reserved.
//

import UIKit
import XCTest

//@testable import TheMovieDatabaseApp

class TheMovieDatabaseAppTests: XCTestCase {
    
    func testFetchMovieList() {
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let movieClient = MovieClient()
        XCTAssertTrue((movieClient!.fetchMovieList("upcoming") as Any) is AnyPromise)
    }
    
}
