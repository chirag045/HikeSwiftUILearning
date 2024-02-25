//
//  MotionAnimationView.swift
//  HikeSwiftUI
//
//  Created by Chirag Gujarati on 7/28/23.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    func randomCordinate() -> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...1.5))
    }
    
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 4...80))
    }
    
    func randomSpeed() -> CGFloat{
        return CGFloat.random(in: 0.05...1)
    }
    
    func randomDelay() -> CGFloat{
        return CGFloat(Int.random(in: 0...2))
    }
    
    var body: some View {
        ForEach(0...randomCircle,id: \.self) { item in
            Circle()
                .foregroundColor(.white)
                .opacity(0.33)
                .frame(width:randomSize())
                .position(x:randomCordinate(),y:randomCordinate())
                .scaleEffect(isAnimating ? randomScale() : 1)
                .onAppear {
                    withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                    ){
                        isAnimating = true
                    }
                }
        }
        .frame(width: 256,height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
          .background(
            Circle()
              .fill(.teal)
          )
    }
}
