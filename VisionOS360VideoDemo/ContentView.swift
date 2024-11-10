//
//  ContentView.swift
//  VisionOS360VideoDemo
//
//  Created by Vishal Khokad on 29/09/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import AVKit

struct ContentView: View {
    var body: some View {
        RealityView { content in
            // Load 360 video as texture for a sphere
            let url = URL(string: "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8")!
//            let videoURL = Bundle.main.url(forResource: "360_video", withExtension: "mp4")!
//            let avPlayer = AVPlayer(url: url)
//            
//            let videoMaterial = VideoMaterial(avPlayer: avPlayer)
//            
//            // Create a sphere for the 360-degree video
//            let sphereMesh = MeshResource.generateSphere(radius: 1.0) // Adjust radius for immersion
//            let sphereEntity = ModelEntity(mesh: sphereMesh, materials: [videoMaterial])
//            
//            // Invert the sphere to view from inside
//            sphereEntity.scale = SIMD3<Float>(-1.0, 1.0, 1.0)
//            
//            // Add sphere to the RealityKit scene
//            let anchorEntity = AnchorEntity()
//            anchorEntity.addChild(sphereEntity)
//            
//            content.add(anchorEntity)
//            avPlayer.play()
            let videoEntity = Entity()

            let asset = AVURLAsset(url: url)
            let playerItem = AVPlayerItem(asset: asset)
            let player = AVPlayer()

            //create a videoMaterial
            let material = VideoMaterial(avPlayer: player)

            //Made a Sphere with the videoEntity and asign the videoMaterial to it
            videoEntity.components.set(ModelComponent(mesh: .generateSphere(radius: 1E3), materials: [material]))

            //adjust the properties of the videoEntity(Sphere) if needed
            videoEntity.scale = .init(x: 1, y: 1, z: -1)
            videoEntity.transform.translation += SIMD3<Float>(0.0, 10.0, 0.0)

            let angle = Angle.degrees(90)
            let rotation = simd_quatf(angle: Float(angle.radians), axis: .init(x: 0, y: 0, z: 0))

            videoEntity.transform.rotation = rotation

            //add VideoEntity to realityView
            content.add(videoEntity)
            
            //start the VideoPlayer
            player.replaceCurrentItem(with: playerItem)
            player.play()
        }
    }
}

//#Preview(windowStyle: .automatic) {
//    ContentView()
//}
