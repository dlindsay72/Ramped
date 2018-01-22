//
//  Ramp.swift
//  Ramped
//
//  Created by Dan Lindsay on 2018-01-22.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import UIKit
import SceneKit

class Ramp {
    
    class func getRampForName(rampName: String) -> SCNNode {
        switch rampName {
        case "pipe":
            return Ramp.getPipe()
        case "pyramid":
            return Ramp.getPyramid()
        case "quarter":
            return Ramp.getQuarter()
        default:
            return Ramp.getPipe()
        }
    }
    
    class func getPipe() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/pipe.scn")
        let node = obj?.rootNode.childNode(withName: "pipe", recursively: true)
        node?.scale = SCNVector3Make(0.0025, 0.0025, 0.0025)
        node?.position = SCNVector3Make(-1, 0.75, -1)
        
        return node!
    }
    
    class func getPyramid() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/pyramid.scn")
        let node = obj?.rootNode.childNode(withName: "pyramid", recursively: true)
        node?.scale = SCNVector3Make(0.0055, 0.0055, 0.0055)
        node?.position = SCNVector3Make(-0.95, -0.5, -1)
        
        return node!
    }
    
    class func getQuarter() -> SCNNode {
        let obj = SCNScene(named: "art.scnassets/quarter.scn")
        let node = obj?.rootNode.childNode(withName: "quarter", recursively: true)
        node?.scale = SCNVector3Make(0.0055, 0.0055, 0.0055)
        node?.position = SCNVector3Make(-0.9, -1.9, -1)
        
        return node!
    }
    
    class func startRotation(node: SCNNode) {
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: CGFloat(0.01 * Double.pi), y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        node.runAction(rotate)
    }
    
    
}








