//
//  MathTokenType.swift
//  Solver
//
//  Created by Evgeniy on 05.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public enum MathTokenType {
    case openBracket, closeBracket
    case operand(Double)
    case operation(MathOperatorType)
}

extension MathTokenType {

    public var isOperand: Bool {
        switch self {
        case .operand: return true
        default: return false
        }
    }

    public var isBracket: Bool {
        switch self {
        case .openBracket, .closeBracket: return true
        default: return false
        }
    }

    public var isOpenBracket: Bool {
        switch self {
        case .openBracket: return true
        default: return false
        }
    }

    public var isCloseBracket: Bool {
        switch self {
        case .closeBracket: return true
        default: return false
        }
    }

    public var isOperator: Bool {
        switch self {
        case .operation: return true
        default: return false
        }
    }
}

extension MathTokenType: CustomStringConvertible {

    public var description: String {
        switch self {
        case .openBracket: return "("
        case .closeBracket: return ")"
        case .operand(let value): return "\(value)"
        case .operation(let token): return "\(token.description)"
        }
    }
}
