//
//  CustomBackgroundView.swift
//  HikeSwiftUI
//
//  Created by Chirag Gujarati on 7/28/23.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isGradiantAnimate = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [.colorIndigoMedium,.colorSalmonLight],
                                     startPoint: isGradiantAnimate ? .topLeading : .bottomLeading,
                                     endPoint: isGradiantAnimate ? .bottomTrailing : .topTrailing))
                .onAppear{
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses:true)){
                        isGradiantAnimate.toggle()
                    }
                    
                }
            
            MotionAnimationView()
        }
        .frame(width: 256,height: 256)
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
