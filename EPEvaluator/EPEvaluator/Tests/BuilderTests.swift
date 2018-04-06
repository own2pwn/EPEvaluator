//
//  BuilderTests.swift
//  SolverTests
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

@testable import EPEvaluator
import XCTest

final class BuilderTests: XCTestCase {
    // MARK: - Members
    
    private let builder = ExpressionBuilder()
    
    // MARK: - Tests
    
    func testCaseOne() {
        let e = builder.addOperand(7)
            .addOperator(minus)
            .addOperand(3)
            .addOperator(mul)
            .addOperand(2)
            .build()
        
        let expectedTokensCount = 5
        let actualCount = e.tokens.count
        XCTAssert(expectedTokensCount == actualCount, "expected tokens in expression: \(expectedTokensCount) actual tokens: \(actualCount)")
        
        let expectedRepresentation = "7.0 - 3.0 * 2.0"
        let builded = e.description
        XCTAssert(expectedRepresentation == builded, "expected expression: \(expectedRepresentation) actual expression: \(builded)")
    }
    
    // MARK: - Operators
    
    private let minus = MathOperatorType.sub
    
    private let plus = MathOperatorType.add
    
    private let mul = MathOperatorType.mul
    
    private let div = MathOperatorType.div
}
