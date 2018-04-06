//
//  main.swift
//  EPEvaluator
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

let builder = ExpressionBuilder()
let representer = PostfixNotationRepresenter()
let evaluator = ExpressionEvaluator()

let expr = builder.addOperand(2).addOperator(.add).addOperand(2).build()
let postfix = representer.represent(expr)
let result = evaluator.evaluate(postfix)

print("\(expr) == \(result) \n[\(postfix)]")
