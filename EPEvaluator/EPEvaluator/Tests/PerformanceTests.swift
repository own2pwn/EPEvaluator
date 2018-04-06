//
//  PerformanceTests.swift
//  SolverTests
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

@testable import EPEvaluator
import XCTest

final class PerformanceTests: XCTestCase {
    // MARK: - Members

    private let provider = ExpressionProvider.self

    private let representer = PostfixNotationRepresenter()

    private let eval = ExpressionEvaluator()

    // MARK: - Tests

    func testPerformanceRepresentation() {
        let expressions = provider.all

        measure {
            let expression = expressions.randomElement
            _ = representer.represent(expression)
        }
    }

    func testPerformanceEvaluation() {
        let expressions = provider.all
        let represented = expressions.map { representer.represent($0) }

        measure {
            let expression = represented.randomElement
            _ = eval.evaluate(expression)
        }
    }

    func testPerformanceFullEvaluation() {
        let expressions = provider.all

        measure {
            let expression = expressions.randomElement
            let represented = representer.represent(expression)

            _ = eval.evaluate(represented)
        }
    }
}
