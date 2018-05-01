//
//  ExpressionEvaluator.swift
//  Solver
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public final class ExpressionEvaluator {
    // MARK: - Interface
    
    public typealias Token = MathToken
    
    /// Assumes `expression` passed in `postfix (polish)` notation.
    public func evaluate(_ expression: MathExpression) -> Double? {
        process(expression)
        
        return stack.pop()
    }
    
    public func evaluate(_ expression: [MathToken]) -> Double? {
        process(expression)
        
        return stack.pop()
    }
    
    // MARK: - Members
    
    private let stack: Stack<Double>
    
    // MARK: - Methods
    
    private func process(_ expression: MathExpression) {
        process(expression.tokens)
    }
    
    private func process(_ tokens: [MathToken]) {
        for token in tokens {
            let type = token.tokenType
            let processor = type.isOperator ? processOperator : processOperand
            processor(token)
        }
    }
    
    private func processOperand(_ token: Token) {
        guard let value = token.operand else { return }
        stack.push(value)
    }
    
    private func processOperator(_ token: Token) {
        guard let mathOperation = token.mathOperator else { return }
        
        let processor = mathOperation.isUnary ? processUnaryOperator : processBinaryOperator
        processor(mathOperation)
    }
    
    private func processUnaryOperator(_ mathOperator: MathOperatorType) {
        guard let operand = stack.pop(),
            let evaluator = mathOperator.unaryEvaluator else { return }
        
        let result = evaluator(operand)
        stack.push(result)
    }
    
    private func processBinaryOperator(_ mathOperator: MathOperatorType) {
        guard let operands = stack.popTwo(),
            let evaluator = mathOperator.binaryEvaluator else { return }
        
        let result = evaluator(operands.newest, operands.latest)
        
        if mathOperator.isVolumeOperator {
            stack.push(operands.newest)
            stack.push(result)
        } else {
            stack.push(result)
        }
    }
    
    // MARK: - Init
    
    public init() {
        stack = Stack<Double>()
    }
}
