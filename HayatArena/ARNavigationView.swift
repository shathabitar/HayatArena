//
//  ARNavigationView.swift
//  HayatArena
//
//  Created by Shatha Bitar on 24/04/2025.
//


import SwiftUI
import ARKit
import SceneKit

struct ARNavigationView: View {
    @State private var sceneView: ARSCNView?
    @State private var directionArrow: SCNNode?
    
    var seatPosition: SCNVector3
    
    var body: some View {
        VStack {
            Text("Navigate to Your Seat")
                .font(.largeTitle)
                .bold()
                .padding()
            
            ARViewContainer(seatPosition: seatPosition)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                // Example button action to simulate guiding the user to the seat
                addArrowToScene()
            }) {
                Text("Start AR Navigation")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func addArrowToScene() {
        // Add an arrow to indicate the direction to the seat
        if let sceneView = sceneView {
            let arrowNode = createArrowNode()
            sceneView.scene.rootNode.addChildNode(arrowNode)
            directionArrow = arrowNode
        }
    }
    
    func createArrowNode() -> SCNNode {
        let arrowGeometry = SCNCone(topRadius: 0, bottomRadius: 0.05, height: 0.2)
        let arrowNode = SCNNode(geometry: arrowGeometry)
        arrowNode.position = seatPosition // Position at the seat location
        
        // Add color or texture to the arrow for visibility
        arrowNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        
        return arrowNode
    }
}

struct ARViewContainer: UIViewRepresentable {
    var seatPosition: SCNVector3
    
    func makeUIView(context: Context) -> ARSCNView {
        let sceneView = ARSCNView(frame: .zero)
        sceneView.autoenablesDefaultLighting = true
        sceneView.delegate = context.coordinator
        sceneView.scene = SCNScene()
        
        // Set up AR session
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        return sceneView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {
        // Update the AR view if needed
    }
    
    func makeCoordinator() -> ARCoordinator {
        return ARCoordinator(seatPosition: seatPosition)
    }
}

class ARCoordinator: NSObject, ARSCNViewDelegate {
    var seatPosition: SCNVector3
    
    init(seatPosition: SCNVector3) {
        self.seatPosition = seatPosition
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        // You can use ARFrame to update the position of your virtual objects if needed
    }
}

#Preview {
    ARNavigationView(seatPosition: SCNVector3(0, 0, -1))  // Example position
}
