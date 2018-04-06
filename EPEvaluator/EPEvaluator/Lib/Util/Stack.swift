//
//  Stack.swift
//  Solver
//
//  Created by Evgeniy on 05.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

import Foundation

public final class Stack<Element> {
    // MARK: - Members
    
    private var stack: [Element]
    
    // MARK: - Interface
    
    // MARK: Members
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    // MARK: Methods
    
    public func push(_ element: Element) {
        stack.append(element)
    }
    
    public func pop() -> Element? {
        return stack.popLast()
    }
    
    public func popTwo() -> (latest: Element, newest: Element)? {
        guard let l = pop(), let n = pop() else { return nil }
        
        return (l, n)
    }
    
    /// TBH this way it looks like deque.
    public func tail() -> Element? {
        return count > 0 ? stack[0] : nil
    }
    
    public func removeAll() {
        stack.removeAll(keepingCapacity: true)
    }
    
    // MARK: - Init
    
    public init() {
        stack = []
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        return stack.description
    }
}

extension Stack: IteratorProtocol, Sequence {
    
    public func next() -> Element? {
        return pop()
    }
    
    public func makeIterator() -> AnyIterator<Element> {
        var copy = stack
        
        return AnyIterator { copy.popLast() }
    }
}
