//
//  MathToken.swift
//  Solver
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public struct MathToken {
    public let tokenType: MathTokenType

    public init(type: MathTokenType) {
        tokenType = type
    }
}

extension MathToken {

    public var operand: Double? {
        switch tokenType {
        case .operand(let val): return val
        default: return nil
        }
    }

    public var mathOperator: MathOperatorType? {
        switch tokenType {
        case .operation(let op): return op
        default: return nil
        }
    }
}

extension MathToken: CustomStringConvertible {

    public var description: String {
        return tokenType.description
    }
}
