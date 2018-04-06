//
//  PostfixNotationRepresenter.swift
//  Solver
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public final class PostfixNotationRepresenter {
    
    public typealias Token = MathToken
    
    // MARK: - Interface
    
    public func represent(_ expression: MathExpression) -> MathExpression {
        let represented = processExpression(expression)
        
        return MathExpression(represented)
    }
    
    // MARK: - Internal
    
    // MARK: Members
    
    private let stack: Stack<Token>
    
    private var represented: [Token]
    
    // MARK: Methods
    
    private func processExpression(_ expression: MathExpression) -> [Token] {
        stack.removeAll()
        represented.removeAll(keepingCapacity: true)
        
        for token in expression.tokens {
            let type = token.tokenType
            let processor = type.isOperand ? processOperand
                : type.isOperator ? processOperator : processBracket
            
            processor(token)
        }
        
        while let op = stack.next() {
            represented.append(op)
        }
        
        return represented
    }
    
    private func processOperand(_ token: Token) {
        represented.append(token)
    }
    
    private func processOperator(_ token: Token) {
        for opToken in stack.makeIterator() {
            guard opToken.tokenType.isOperator else { break }
            guard let mathOperator = opToken.mathOperator else { continue }
            guard let p = token.mathOperator?.precedence, p <= mathOperator.precedence else { break }
            
            let popped = stack.pop()!
            represented.append(popped)
        }
        
        stack.push(token)
    }
    
    private func processBracket(_ token: Token) {
        let processor = token.tokenType.isOpenBracket ? processOpenBracket : processCloseBracket
        processor(token)
    }
    
    private func processOpenBracket(_ token: Token) {
        stack.push(token)
    }
    
    private func processCloseBracket(_ token: Token) {
        while let opToken = stack.pop(), !opToken.tokenType.isOpenBracket {
            represented.append(opToken)
        }
    }
    
    // MARK: - Init
    
    public init() {
        stack = Stack<Token>()
        represented = []
    }
}
