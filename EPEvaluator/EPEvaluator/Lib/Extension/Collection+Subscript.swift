//
//  Collection+Subscript.swift
//  Solver
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public extension Array {

    public func element(at index: Int) -> Element? {
        let value: Element? = index < count ? self[index] : nil

        return value
    }
}
