//
//  RampPickerVC.swift
//  Ramped
//
//  Created by Dan Lindsay on 2018-01-17.
//  Copyright © 2018 Dan Lindsay. All rights reserved.
//

import UIKit
import SceneKit

class RampPickerVC: UIViewController {
    
    var sceneView: SCNView!
    var size: CGSize!
    weak var rampPlacerVC: RampPlacerVC!
    
    init(size: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.frame = CGRect(origin: .zero, size: size)
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.insertSubview(sceneView, at: 0)
        
        preferredContentSize = size
        
        let scene = SCNScene(named: "art.scnassets/ramps.scn")!
        sceneView.scene = scene
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
        
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: CGFloat(0.01 * Double.pi), y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        
        
        var obj = SCNScene(named: "art.scnassets/pipe.scn")
        var node = obj?.rootNode.childNode(withName: "pipe", recursively: true)
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0025, 0.0025, 0.0025)
        node?.position = SCNVector3Make(-1, 0.75, -1)
        scene.rootNode.addChildNode(node!)
        
        obj = SCNScene(named: "art.scnassets/pyramid.scn")
        node = obj?.rootNode.childNode(withName: "pyramid", recursively: true)
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0055, 0.0055, 0.0055)
        node?.position = SCNVector3Make(-0.95, -0.5, -1)
        scene.rootNode.addChildNode(node!)
        
        obj = SCNScene(named: "art.scnassets/quarter.scn")
        node = obj?.rootNode.childNode(withName: "quarter", recursively: true)
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0055, 0.0055, 0.0055)
        node?.position = SCNVector3Make(-0.9, -1.9, -1)
        scene.rootNode.addChildNode(node!)
        
    }
    
    @objc func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        let p = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        
        if hitResults.count > 0 {
            let node = hitResults[0].node
            rampPlacerVC.rampSelected(node.name!)
            print(node.name!)
        }
    }

}
