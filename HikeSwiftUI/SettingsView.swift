//
//  SettingsView.swift
//  HikeSwiftUI
//
//  Created by Chirag Gujarati on 7/28/23.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
      "AppIcon-MagnifyingGlass",
      "AppIcon-Map",
      "AppIcon-Mushroom",
      "AppIcon-Camera",
      "AppIcon-Backpack",
      "AppIcon-Campfire"
    ]
    
    var body: some View {
        List{
            Section{
                HStack{
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack {
                        Text("Hike")
                            .font(.system(size: 60,weight: .black))
                        
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.colorGreenLight,.colorGrayMedium,.teal], startPoint: .top, endPoint: .bottom))
                .padding(.top,8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,15)
                .frame(maxWidth: .infinity)
            }.listRowSeparator(.hidden)
            
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) was pressed.")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                                    if error != nil {
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }.padding(.top, 12)
                    
                    Text("Choose your favourite app icon from the collection above.")
                      .frame(minWidth: 0, maxWidth: .infinity)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.secondary)
                      .font(.footnote)
                      .padding(.bottom, 12)
                  } //: SECTION
                  .listRowSeparator(.hidden)
            
            Section(
                header: Text("About the App"),
                footer:
                    HStack{
                        Spacer()
                        Text("Copyright © All right reserved.")
                        Spacer()
                    }
                    .padding(.vertical, 8)
            ){
                CustomListRowView(rowTitle: "Application", rowContent: "HIKE", rowTintColor: .blue, rowIcon: "apps.iphone")
                
                CustomListRowView(rowTitle: "Compatibility", rowContent: "iOS, iPadOS", rowTintColor: .red, rowIcon: "info.circle")
                
                CustomListRowView(rowTitle: "Technology", rowContent: "Swift", rowTintColor: .orange, rowIcon: "swift")
                
                CustomListRowView(rowTitle: "Version", rowContent: "1.0", rowTintColor: .purple, rowIcon: "gear")
                
                CustomListRowView(rowTitle: "Developer", rowTintColor: .purple, rowIcon: "globe",rowLineTitle: "Chirag Gujarati",rowLinkNavURL: "https://github.com/chirag045")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
