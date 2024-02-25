//
//  CustomBackgroundView.swift
//  HikeSwiftUI
//
//  Created by Chirag Gujarati on 7/27/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            LinearGradient(
                colors: [
                    Color.colorGreenLight,
                    Color.colorGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding()
    }
}
