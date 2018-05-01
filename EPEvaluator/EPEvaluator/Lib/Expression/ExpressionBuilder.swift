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
    
    public func removeLast() {
        guard expression.count > 0 else { return }
        
        let token = expression.removeLast()
        if token.tokenType.isCloseBracket {
            openBracketCount += 1
        } else if token.tokenType.isOpenBracket {
            openBracketCount -= 1
        }
    }
    
    public func build() -> MathExpression {
        let result = MathExpression(expression)
        
        return result
    }
    
    @discardableResult
    public func addOperand(_ op: Double) -> RType {
        let thisOperandValue = op.intValue
        
        guard let previousToken = expression.last else {
            addNewOperand(op)
            
            return self
        }
        
        switch previousToken.tokenType {
        case .operand(let value):
            guard value <= Double(Int.max) else { return self }
            
            let prevValue = Int(value)
            let doubleValue = Double(prevValue)
            
            guard doubleValue == value else {
                // fract
                let str = "\(value)\(thisOperandValue)"
                let commaIndex = str.index(of: ".")!
                let distance = str.distance(from: commaIndex, to: str.endIndex)
                guard distance < 6 else { break }
                
                let d = Double(str)!
                
                let c = Double(str)
                assert(c != nil)
                
                expression.removeLast()
                let newToken = MathToken(type: .operand(d))
                expression.append(newToken)
                
                break
            }
            
            let newExpr = String("\(prevValue)\(thisOperandValue)")
            parseString(newExpr)
            
        case .comma:
            assert(expression.count >= 2)
            let index = expression.count - 2
            let beforeToken = expression[index]
            let prevValue = beforeToken.operand!.intValue
            
            let newExpr = String("\(prevValue).\(thisOperandValue)")
            expression.removeLast()
            parseString(newExpr)
            
        case .operation, .openBracket, .closeBracket: addNewOperand(op)
        }
        
        return self
    }
    
    private func addNewOperand(_ value: Double) {
        let newToken = MathToken(type: .operand(value))
        expression.append(newToken)
    }
    
    private func parseString(_ expr: String) {
        let c = Double(expr)
        assert(c != nil)
        
        let newValue = Double(expr)!
        let newToken = MathToken(type: .operand(newValue))
        expression.removeLast()
        expression.append(newToken)
    }
    
    @discardableResult
    public func addOperator(_ op: MathOperatorType) -> RType {
        guard let lastToken = expression.last else { return self }
        
        let type = lastToken.tokenType
        guard type.isOperand || type.isCloseBracket || type.isVolumeOperator else { return self }
        
        let newToken = MathToken(type: .operation(op))
        expression.append(newToken)
        
        return self
    }
    
    @discardableResult
    public func addOpenBracket() -> RType {
        if let lastToken = expression.last {
            guard lastToken.tokenType.isOperator else { return self }
        }
        
        let newToken = MathToken(type: .openBracket)
        expression.append(newToken)
        openBracketCount += 1
        
        return self
    }
    
    private var openBracketCount = 0
    
    @discardableResult
    public func addCloseBracket() -> RType {
        guard let lastToken = expression.last, lastToken.tokenType.isOperand || lastToken.tokenType.isVolumeOperator, openBracketCount > 0 else {
            return self
        }
        
        let newToken = MathToken(type: .closeBracket)
        expression.append(newToken)
        openBracketCount -= 1
        
        return self
    }
    
    @discardableResult
    public func addComma() -> RType {
        let comma = MathToken(type: .comma)
        
        if let lastToken = expression.last {
            guard !lastToken.tokenType.isComma else { return self }
            if let operand = lastToken.operand {
                guard operand == Double(operand.intValue) else { return self }
            }
            expression.append(comma)
            
        } else {
            let newToken = MathToken(type: .operand(0))
            expression.append(contentsOf: [newToken, comma])
        }
        
        return self
    }
    
    // MARK: - Init
    
    public init() {
        expression = []
    }
}

extension ExpressionBuilder {
    @discardableResult
    public func addOperand(_ value: Int) -> RType {
        return addOperand(Double(value))
    }
}

extension ExpressionBuilder {
    public var currentExpression: [MathToken] {
        return expression
    }
}

extension ExpressionBuilder: CustomStringConvertible {
    public var description: String {
        let str = expression.map { $0.description }
        
        return str.joined(separator: .space)
    }
    
    public var expressionString: String {
        guard expression.count > 0 else { return "0" }
        
        let str = expression.map { $0.expressionString }
        
        return str.joined(separator: "")
    }
    
    public var displayString: String {
        guard expression.count > 0 else { return "0" }
        
        let str = expression.map { $0.displayString }
        
        return str.joined(separator: "")
    }
}
