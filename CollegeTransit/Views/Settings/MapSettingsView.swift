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
                    Toggle(isOn: $uPrefs.mapScaleEnabled){
                        Text("Show map scale")
                    }
                    Toggle(isOn: $uPrefs.mapTrafficEnabled){
                        Text("Show traffic")
                    }
                    Toggle(isOn: $uPrefs.mapAllowPitchEnabled){
                        Text("Allow map pitch")
                    }
                }// End Section
                
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
