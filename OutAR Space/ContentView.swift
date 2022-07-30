//
//  ContentView.swift
//  deneme
//
//  Created by İremsu  Baş  on 25.04.2022.
//

import SwiftUI
import RealityKit
import CoreMotion


struct ContentView: View {
    
    
    var motionManager = CMMotionManager()
    var rotationRate = CMRotationRate()
   
    let directions = ["Turn Right!", "Turn Left!", "Go 2 Units Straight!", "Go 3 Units Straight!"]
    
    var correctdir = false
    
    
   @State var num = 0
                var body: some View {
                        
                    ZStack(){

                        ARViewContainer()
                        
                        HStack(spacing: 350){
                                    VStack(spacing: 200){
                                        Text (directions[num])
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .padding()
                                        .frame(width: 250, height: 70, alignment: .center)
                                        .background(Color(red: 0.443, green: 0.757, blue: 0.980))
                                        .cornerRadius(20)
                                    Text(" ")
                                        }
                            Text(" ")
                  
                        }
                    
                    }.edgesIgnoringSafeArea(.all)
                    
 
                .onAppear(){

                    
                    // 1'den büyük sağ, -1'den küçük sol
                    motionManager.gyroUpdateInterval = 0.5
                    
                    motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
                        if let myData = data
                        {
                            if myData.rotationRate.x > 1 && num == 0
                            {
                                print ("x turned right")
                                print (myData.rotationRate.x)
                                num = Int.random(in: 0..<2)}
                            if myData.rotationRate.x < -1 && num == 1
                            {
                                print ("turned left")
                                print (myData.rotationRate.x)
                                num = Int.random(in: 0..<2)
                            }
                         /*  if myData.rotationRate.y > -5
                            {
                                print ("y ")
                                print (myData.rotationRate.y)
                            if myData.rotationRate.z > -5
                            {
                                print ("z ")
                                print (myData.rotationRate.z)
                            }
                            //if myData.rotationRate.x
                        }*/
                            
                }
            }
        }
                        
                }
        

    }



struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif


