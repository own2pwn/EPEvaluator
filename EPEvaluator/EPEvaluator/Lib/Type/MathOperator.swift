//
//  MathOperator.swift
//  Solver
//
//  Created by Evgeniy on 05.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public enum MathOperatorType {
    case add, sub
    case mul, div
    case percent
}

extension MathOperatorType {

    public var precedence: Int {
        switch self {
        case .add, .sub: return 2
        case .mul, .div, .percent: return 3
        }
    }
}

extension MathOperatorType {

    public var isUnary: Bool {
        switch self {
        // case .percent: return true
        default: return false
        }
    }

    // We want % apply to a whole value e.g.
    // 60 + 10% = 66
    public var isVolumeOperator: Bool {
        switch self {
        case .percent: return true
        default: return false
        }
    }
}

extension MathOperatorType: CustomStringConvertible {

    public var description: String {
        switch self {
        case .add: return "+"
        case .sub: return "-"
        case .mul: return "*"
        case .div: return "/"
        case .percent: return "%"
        }
    }
}
