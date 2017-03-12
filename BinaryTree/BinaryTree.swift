//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by ABC on 3/12/17.
//  Copyright © 2017 GUM. All rights reserved.
//

import Foundation

class Node {
    var element : Int
    var leftNode : Node?
    var rightNode : Node?
    var parentNode : Node?
    var countOfElements = 0
    var countOfChildNodes = 0
    
    init(_ element:Int) {
        self.element = element
    }
}

//!Each binary tree node has 0-2 child nodes.
//!A Binary tree has max of 2^h leaves.
//!A Binary tree has max of (2^(h+1))-1 nodes.
//!Considering h is the height of the tree.
//!Height of Root node is 0 and further calculated based on that.
//!Binary tree will have "n-1" edges where n is the number of nodes in the B-tree.
class BinaryTree {
    internal var rootNode : Node?
    
    func search(_ element:Int) -> Node? {
        var node : Node? = nil
        let searchResult = search_internal(element)
        if searchResult.found == true  {
            node = searchResult.node
        }
        return node;
    }
    
    internal func search_internal(_ element:Int) -> (node:Node?, found:Bool) {
        var node : Node? = nil
        var found = false
        
        guard rootNode != nil else {
            //!Binary tree is empty, return nil in that case.
            return (node, found)
        }
        node = rootNode
        repeat {
            if element == node?.element  {
                found = true
                break;
            } else if element < (node?.element)! {
                //!Traverse the left sub-tree.
                node = node?.leftNode
            } else {
                //!Traverse the right sub-tree.
                node = node?.rightNode
            }
        } while node != nil
        
        return (node, found);
    }

    func insert(_ element:Int) -> Node? {
        
        var node : Node?
        let searchResult = search_internal(element)
        
        if searchResult.found == false {
            //!create a new node and insert in the tree.
            node = Node(element)
            if element < (searchResult.node?.element)! {
                searchResult.node?.leftNode = node
            } else {
                searchResult.node?.rightNode = node
            }
        } else {
            //!The tree already has the element added in it.
            //!Increase the count of it.
            node = searchResult.node
            node?.countOfElements += 1
        }
        
        return node
    }
    
//    func remove(_ object:AnyObject?) -> Node? {
//        var newNode = Node()
//        
//        return newNode
//    }
//
//    func preorderTraversal(_ rootNode:Node?){
//        //!Root-Left-Right
//        while <#condition#> {
//            <#code#>
//        }
//    }
//    
//    func inorderTraversal(_ rootNode:Node?){
//        //!Left-Root-Right
//    }
//    
//    func postorderTraversal(_ rootNode:Node?){
//        //!Left-Right-Root
//    }
    
}
