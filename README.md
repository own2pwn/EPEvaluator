 Runtime Math expression builder and evaluator
 
 It supports `- + * / %` operators, `( )` tokens and handles operation precedence.
 
 Work algorithm:
 1. Converts infix input expression to a postfix notation using `Shunting-yard` algorithm.
 2. Evaluates represented expression.
 
 ```swift
let builder = ExpressionBuilder()
let representer = PostfixNotationRepresenter()
let evaluator = ExpressionEvaluator()

let expr = builder.addOperand(2).addOperator(.add).addOperand(2).build()
let postfix = representer.represent(expr)
let result = evaluator.evaluate(postfix)

print("\(expr) == \(result) \n[\(postfix)]")

// 2.0 + 2.0 == 4.0 
// [2.0 2.0 +]

 ```
