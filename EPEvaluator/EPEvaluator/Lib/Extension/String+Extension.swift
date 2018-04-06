//
//  String+Extension.swift
//  Solver
//
//  Created by Evgeniy on 05.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public extension String {

    public static var space: String {
        return " "
    }

    public var spaceRemoved: String {
        return self.replacingOccurrences(of: String.space, with: "")
    }
}
