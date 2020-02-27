//
//  SettingsView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/25/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                    
                    List {
                        
                        Section{
                            NavigationLink(destination: MapSettingsView()){
                                Text("Map")
                            }
                        }
                        
                        
                    }.navigationBarTitle("Settings")
                .listStyle(GroupedListStyle())
                //.environment(\.horizontalSizeClass, .regular)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
