//
//  CardView.swift
//  HikeSwiftUI
//
//  Created by Chirag Gujarati on 7/27/23.
//

import SwiftUI

struct CardView: View {
    @State private var randomNumber: Int = 1
    @State private var imageNumber: Int = 1
    @State private var isSheetPresent: Bool = false
    
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
 
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
                
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .font(.system(size: 50))
                            .fontWeight(.black)
                        .foregroundStyle(LinearGradient(colors: [.colorGrayLight, .colorGreenDark], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        Button{
                            isSheetPresent.toggle()
                        }label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isSheetPresent) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                }.padding(.horizontal,30)
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                Button{
                    randomImage()
                }label: {
                    Text("Explore More")
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.colorGreenLight,.colorGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.2), radius: 0.2,x:1,y:2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320,height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
