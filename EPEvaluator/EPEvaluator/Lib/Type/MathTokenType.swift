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
    case comma
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

    public var isVolumeOperator: Bool {
        switch self {
        case .operation(let op): return op.isVolumeOperator
        default: return false
        }
    }

    public var isComma: Bool {
        switch self {
        case .comma: return true
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
        case .comma: return ","
        case .operand(let value): return "\(value)"
        case .operation(let token): return "\(token.description)"
        }
    }
}

public extension Double {
    public var expressionValue: String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.groupingSeparator = " "
        fmt.maximumFractionDigits = 4

        let str = fmt.string(from: self as NSNumber)
        assert(str != nil)

        return str!

        // return trim(description)
    }

    private func trim(_ string: String) -> String {
        var converted = string

        while converted.last == "0" {
            converted.removeLast()
        }

        if converted.last == "." {
            converted.removeLast()
        }

        converted = converted.replacingOccurrences(of: ".", with: ",")

        return converted
    }

    private func trimDisplay(_ str: String) -> String {
        var converted = trim(str)

        if converted.last == "," {
            converted.removeLast()
        }

        return converted
    }

    public var displayValue: String {
        // let converted = String(format: "%.2f", self)
        // let trimmed = trim(converted)

        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.groupingSeparator = " "
        fmt.minimumFractionDigits = 2
        fmt.maximumFractionDigits = 2

        let str = fmt.string(from: self as NSNumber)
        assert(str != nil)

        return trimDisplay(str!)
    }
}

public extension MathTokenType {
    public var expressionString: String {
        switch self {
        case .openBracket: return "( "
        case .closeBracket: return " )"
        case .comma: return "."
        case .operand(let value): return "\(value.expressionValue)"
        case .operation(let token): return "\(token.expressionString)"
        }
    }

    public var displayString: String {
        switch self {
        case .openBracket: return "( "
        case .closeBracket: return " )"
        case .comma: return "."
        case .operand(let value): return "\(value.displayValue)"
        case .operation(let token): return "\(token.displayString)"
        }
    }
}
