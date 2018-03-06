//
//  RESULT.swift
//  MVP+TestsTests
//
//  Created by Mike Haydan on 06/03/2018.
//  Copyright © 2018 Mike Haydan. All rights reserved.
//

import Foundation

@testable import MVP_Tests

extension Result: Equatable { }

public func ==<T>(lhs: Result<T>, rhs: Result<T>) -> Bool {
    // Shouldn't be used for PRODUCTION enum comparison. Good enough for unit tests.
    return String(stringInterpolationSegment: lhs) == String(stringInterpolationSegment: rhs)
}
