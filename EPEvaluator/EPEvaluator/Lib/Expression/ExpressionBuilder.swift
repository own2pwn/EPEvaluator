//
//  MathExpressionBuilder.swift
//  Solver
//
//  Created by Evgeniy on 05.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public final class ExpressionBuilder {
    // MARK: - Members
    
    private var expression: [MathToken]
    
    // MARK: - Interface
    
    public typealias RType = ExpressionBuilder
    
    // MARK: Methods
    
    @discardableResult
    public func startNew() -> RType {
        expression.removeAll(keepingCapacity: true)
        
        return self
    }
    
    public func build() -> MathExpression {
        let result = MathExpression(expression)
        startNew()
        
        return result
    }
    
    public func addOperand(_ op: Double) -> RType {
        let newToken = MathToken(type: .operand(op))
        expression.append(newToken)
        
        return self
    }
    
    public func addOperator(_ op: MathOperatorType) -> RType {
        let newToken = MathToken(type: .operation(op))
        expression.append(newToken)
        
        return self
    }
    
    public func addOpenBracket() -> RType {
        let newToken = MathToken(type: .openBracket)
        expression.append(newToken)
        
        return self
    }
    
    public func addCloseBracket() -> RType {
        let newToken = MathToken(type: .closeBracket)
        expression.append(newToken)
        
        return self
    }
    
    // MARK: - Init
    
    public init() {
        expression = []
    }
}

extension ExpressionBuilder: CustomStringConvertible {
    
    public var description: String {
        let str = expression.map { $0.description }
        
        return str.joined(separator: .space)
    }
}
