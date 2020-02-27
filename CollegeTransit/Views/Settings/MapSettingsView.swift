//
//  MapSettingsView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/26/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct MapSettingsView: View {
    
    @EnvironmentObject var uPrefs: UPrefDelegate
    
    var body: some View {
        VStack {
            List{
                Section(header: Text("Map Interactions"), footer: Text("Map pitch allows viewing the map at an angle")){
                    Toggle(isOn: $uPrefs.mapCompassEnabled){
                        Text("Show Compass")
                    }
                    Toggle(isOn: $uPrefs.mapTrafficEnabled){
                        Text("Show Traffic")
                    }
                    Toggle(isOn: $uPrefs.mapAllowPitchEnabled){
                        Text("Allow Map Pitch")
                    }
                }// End Section
                Section(footer: Text("Configure whether only starred routes are shown are mapped on startup")){
                    Toggle(isOn: $uPrefs.showStarredOnStartup){
                        Text("Only Starred Startup")
                    }
                }
                
            }// End List
            Spacer()
        }
    }
}

struct MapSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MapSettingsView()
    }
}
