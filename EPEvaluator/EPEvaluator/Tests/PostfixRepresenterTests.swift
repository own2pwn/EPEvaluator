//
//  PostfixRepresenterTests.swift
//  SolverTests
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

@testable import EPEvaluator
import XCTest

final class PostfixRepresenterTests: XCTestCase {
    // MARK: - Members
    
    private let provider = ExpressionProvider.self
    
    private let representer = PostfixNotationRepresenter()
    
    // MARK: - Tests
    
    func testCaseOne() {
        let exp = provider.all[0]
        
        let postfix = "500.0 50000.0 2.0 / 2.0 / +"
        let represented = representer.represent(exp).description
        
        XCTAssert(postfix == represented, "expected expression: \(postfix) actual expression: \(represented) infix: \(exp)")
    }
    
    func testCaseTwo() {
        let exp = provider.all[1]
        
        let postfix = "2.0 3.0 * 1.0 + 4.0 -"
        let represented = representer.represent(exp).description
        
        XCTAssert(postfix == represented, "expected expression: \(postfix) actual expression: \(represented) infix: \(exp)")
    }
}
