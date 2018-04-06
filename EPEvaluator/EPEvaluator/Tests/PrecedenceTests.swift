//
//  PrecedenceTests.swift
//  SolverTests
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

@testable import EPEvaluator
import XCTest

final class PrecedenceTests: XCTestCase {
    // MARK: - Members

    private let builder = ExpressionBuilder()

    private let representer = PostfixNotationRepresenter()

    private let eval = ExpressionEvaluator()

    // MARK: - Tests

    func testCaseOne() {
        let e = builder.addOperand(7)
            .addOperator(minus)
            .addOperand(3)
            .addOperator(mul)
            .addOperand(2)
            .build()

        let postfix = representer.represent(e)

        let result = eval.evaluate(postfix)
        let expected: Double = 1

        XCTAssert(expected == result, " \(e) == \(result) expected \(expected)")
        // 7 - 3 * 2 == 1
    }

    func testCaseTwo() {
        let e = builder.addOpenBracket()
            .addOperand(3)
            .addOperator(mul)
            .addOperand(2)
            .addOperator(plus)
            .addOperand(2)
            .addCloseBracket()
            .addOperator(minus)
            .addOperand(4)
            .addOperator(mul)
            .addOperand(6)
            .addOperator(plus)
            .addOperand(1)
            .build()

        let postfix = representer.represent(e)

        let result = eval.evaluate(postfix)
        let expected: Double = -15

        XCTAssert(expected == result, " \(e) == \(result) expected \(expected)")
        // (3 * 2 + 2) - 4 * 6 + 1 == -15
    }

    func testCaseThree() {
        let e = builder
            .addOperand(1)
            .addOperator(plus)
            .addOperand(2)
            .addOperator(minus)
            .addOperand(3)
            .addOperator(plus)
            .addOperand(4)
            .addOperator(mul)
            .addOperand(-5)
            .build()

        let postfix = representer.represent(e)

        let result = eval.evaluate(postfix)
        let expected: Double = -20

        XCTAssert(expected == result, " \(e) == \(result) expected \(expected)")
        // 1 + 2 - 3 + 4 * -5 == -20
    }

    // MARK: - Operators

    private let minus = MathOperatorType.sub

    private let plus = MathOperatorType.add

    private let mul = MathOperatorType.mul

    private let div = MathOperatorType.div
}
