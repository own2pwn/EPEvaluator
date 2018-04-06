//
//  MathOperatorType+Evaluation.swift
//  Solver
//
//  Created by Evgeniy on 05.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public typealias MathUnaryEvaluator = (Double) -> Double
public typealias MathBinaryEvaluator = ((Double, Double) -> Double)

extension MathOperatorType {
    
    public var binaryEvaluator: MathBinaryEvaluator? {
        switch self {
        case .add: return MathOperatorType.addEvaluator
        case .sub: return MathOperatorType.subEvaluator
        case .mul: return MathOperatorType.mulEvaluator
        case .div: return MathOperatorType.divEvaluator
        case .percent: return MathOperatorType.percentBinaryEvaluator
        }
    }
    
    private struct BinaryEvaluator {
        let evaluator: MathBinaryEvaluator
    }
    
    private static let addEvaluator: MathBinaryEvaluator = BinaryEvaluator(evaluator: +).evaluator
    
    private static let subEvaluator: MathBinaryEvaluator = BinaryEvaluator(evaluator: -).evaluator
    
    private static let mulEvaluator: MathBinaryEvaluator = BinaryEvaluator(evaluator: *).evaluator
    
    private static let divEvaluator: MathBinaryEvaluator = BinaryEvaluator(evaluator: /).evaluator
    
    private static func percentBinaryEvaluator(_ amount: Double, _ percent: Double) -> Double {
        return (amount / 100) * percent
    }
}

extension MathOperatorType {
    
    public var unaryEvaluator: MathUnaryEvaluator? {
        switch self {
        case .percent: return MathOperatorType.percentUnaryEvaluator
        default: return nil
        }
    }
    
    private struct UnaryEvaluator {
        let evaluator: MathUnaryEvaluator
    }
    
    private static func percentUnaryEvaluator(_ amount: Double) -> Double {
        return amount / 100
    }
}
