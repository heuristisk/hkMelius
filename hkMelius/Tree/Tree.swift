//
//  Tree.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 04/11/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

public class Tree<T: Comparable> {

    public var value: T
    public var left: Tree<T>?
    public var right: Tree<T>?
    public init(_ x: T) {
        self.value = x
        self.left = nil
        self.right = nil
    }

    func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }

    func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }

    func isSubtree(t1: Tree<Int>?, t2: Tree<Int>?) -> Bool {
        if (t2 == nil) {
            return true
        }

        if (t1 == nil) {
            return false
        }

        if areIdentical(t1: t1, t2: t2) {
            return true
        }

        return isSubtree(t1: t1?.left, t2: t2)
            || isSubtree(t1: t1?.right, t2: t2)
    }

    func areIdentical(t1: Tree<Int>?, t2: Tree<Int>?) -> Bool
    {
        if (t1 == nil && t2 == nil) {
            return true
        }

        if (t1 == nil || t2 == nil) {
            return false
        }

        return (t1!.value == t2!.value
            && areIdentical(t1: t1?.left, t2: t2?.left)
            && areIdentical(t1: t1?.right, t2: t2?.right))
    }


}

extension Tree {

    func search(value: T) -> Tree<T>? {
        if value < self.value && left != nil {
            return left!.search(value: value)
        } else if value > self.value && right != nil {
            return right!.search(value: value)
        } else if value == self.value{
            return self
        } else {
            return nil
        }
    }

    func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }

    static func kthSmallestInBST(t: Tree<Int>?, k: Int) -> Int {

        var i = 0, ret = 0

        func f(node: Tree<Int>?) {

            if let n = node {

                if let l = n.left {
                    f(node: l)
                }

                i += 1

                if i == k
                {
                    ret = n.value
                }

                if let r = n.right
                {
                    f(node: r)
                }
            }
        }
        
        f(node: t)
        
        return ret
        
    }

    static func isTreeSymmetric(t: Tree<Int>?) -> Bool {

        return isMirror(t1: t, t2: t)
    }

    static func isMirror(t1: Tree<Int>?, t2: Tree<Int>?) -> Bool
    {
        if (t1 == nil && t2 == nil) {
            return true
        }

        if (t1 != nil && t2 != nil && t1!.value == t2!.value) {
            return (isMirror(t1: t1!.left, t2: t2!.right)
                && isMirror(t1: t1!.right, t2: t2!.left))
        }

        return false
    }

    static func hasPathWithGivenSum(t: Tree<Int>?, s: Int) -> Bool {

        if t == nil {
            if s == 0 {
                return true
            } else {
                return false
            }
        }

        if let tree = t {

            if tree.left != nil && tree.right != nil {
                return (hasPathWithGivenSum(t: tree.left,s: s - tree.value) ||
                    hasPathWithGivenSum(t: tree.right,s: s - tree.value))
            }

            if tree.left != nil {
                return hasPathWithGivenSum(t: tree.left, s: s - tree.value)
            } else {
                return hasPathWithGivenSum(t: tree.right, s: s - tree.value)
            }
        }
        
        return false
    }
}
