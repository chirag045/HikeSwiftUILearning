//
//  CustomListRowView.swift
//  HikeSwiftUI
//
//  Created by Chirag Gujarati on 7/28/23.
//

import SwiftUI

struct CustomListRowView: View {
    @State var rowTitle: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowIcon: String
    @State var rowLineTitle: String? = nil
    @State var rowLinkNavURL: String? = nil
    
    var body: some View {
//      Default Way :- LabeledContent("Application",value: "Hike")
        
        LabeledContent{
            if rowContent != nil{
                Text(rowContent ?? "")
            }else if (rowLineTitle != nil && rowLinkNavURL != nil){
                Link(rowLineTitle!,destination: URL(string: rowLinkNavURL!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }else{
                EmptyView()
            }
        }label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width:30,height: 30)
                        .foregroundColor(rowTintColor)
                    
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowTitle)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomListRowView(rowTitle: "Application", rowContent: "Developer", rowTintColor: .pink,rowIcon: "globe")
    }
}
