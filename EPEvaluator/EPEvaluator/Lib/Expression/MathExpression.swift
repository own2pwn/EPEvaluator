//
//  MathExpression.swift
//  Solver
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public struct MathExpression {
    // MARK: - Members
    
    public let tokens: [MathToken]
    
    // MARK: - Init
    
    public init(_ tokens: [MathToken]) {
        self.tokens = tokens
    }
}

extension MathExpression: CustomStringConvertible {
    
    public var description: String {
        let str = tokens.map { $0.description }
        
        return str.joined(separator: .space)
    }
}
