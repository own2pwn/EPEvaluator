//
//  ExpressionProvider.swift
//  Solver
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

@testable import EPEvaluator
import Foundation

public final class ExpressionProvider {
    // MARK: - Members
    
    private static let builder = ExpressionBuilder()
    
    // MARK: - Methods
    
    public static let all: [MathExpression] = [e1, e2, e3, e4, e5, e6, e7, e8, e9]
    
    public static let e1: MathExpression =
        builder.addOperand(500)
        .addOperator(.add)
        .addOperand(50_000)
        .addOperator(.div)
        .addOperand(2)
        .addOperator(.div)
        .addOperand(2)
        .build()
    
    public static let e2: MathExpression =
        builder.addOperand(2)
        .addOperator(.mul)
        .addOperand(3)
        .addOperator(.add)
        .addOperand(1)
        .addOperator(.sub)
        .addOperand(4)
        .build()
    
    public static let e3: MathExpression =
        builder.addOperand(1)
        .addOperator(.add)
        .addOperand(2)
        .addOperator(.mul)
        .addOperand(3)
        .addOperator(.sub)
        .addOperand(4)
        .build()
    
    public static let e4: MathExpression =
        builder.addOperand(2)
        .addOperator(.mul)
        .addOpenBracket()
        .addOperand(3)
        .addOperator(.add)
        .addOperand(1)
        .addCloseBracket()
        .build()
    
    public static let e5: MathExpression =
        builder.addOperand(2)
        .addOperator(.add)
        .addOperand(2)
        .addOperator(.add)
        .addOperator(.add)
        .addOperator(.percent)
        .build()
    
    public static let e6: MathExpression =
        builder.addOperand(6)
        .addOperator(.sub)
        .addOperand(4)
        // .addOperator(.add)
        .addOperator(.mul)
        .addOperand(10)
        .addOperator(.percent)
        .build()
    
    public static let e7: MathExpression =
        builder.addOperand(6)
        .addOperator(.mul)
        .addOperand(2)
        .addOperator(.sub)
        .addOperand(4)
        .addOperator(.mul)
        .addOperand(4)
        .addOperator(.add)
        .addOperand(10)
        .addOperator(.percent)
        .build()
    
    public static let e8: MathExpression =
        builder.addOperand(10)
        .addOpenBracket()
        .addOperand(6)
        .addOperator(.add)
        .addOperand(3)
        .addCloseBracket()
        // .addOperator(.mul)
        // .addOperator(.percent)
        .build()
    
    public static let e9: MathExpression =
        builder.addOperand(60)
        .addOperator(.add)
        .addOperand(10)
        .addOperator(.percent)
        .build()
    
}
