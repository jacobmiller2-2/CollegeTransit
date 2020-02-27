//
//  ContentView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/1/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var bFetcher: BusFetcher
    @EnvironmentObject var rFetcher: RouteFetcher
    
    
       
    var body: some View {
        TabView{
            MapContainer().edgesIgnoringSafeArea(.top)
                .tabItem{
                    Image(systemName: "1.square.fill")
                    Text("Map View")
                }
            
            BusListView(buses: bFetcher.buses)
                .tabItem{
                    Image(systemName: "2.square.fill")
                    Text("Bus List")
                }
            RouteListView(routes: rFetcher.routes)
                .tabItem{
                    Image(systemName: "3.square.fill")
                    Text("Route List")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
            }
        }.edgesIgnoringSafeArea(.init(.top))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
