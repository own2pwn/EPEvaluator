//
//  Array+Random.swift
//  SolverTests
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public extension Array {

    public var randomElement: Element {
        let upper = UInt32(count)
        let random = Int(arc4random_uniform(upper))

        return self[random]
    }
}
