//
//  ViewController.swift
//  BouncingBalls
//
//  Created by Christopher Arriola on 8/4/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        // Create a new scene
        guard let scene = SCNScene(named: "BouncingBalls.scn", inDirectory: "art.scnassets") else { return }
        sceneView.scene = scene
        
        // Add physics bodies
        guard let ballsNode = scene.rootNode.childNode(withName: "balls", recursively: true) else { return }
        let forceDirection = SCNVector3Make(0, 3, 0)
        for ballNode in ballsNode.childNodes {
            let physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
            physicsBody.applyForce(forceDirection, asImpulse: true)
            ballNode.physicsBody = physicsBody
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
