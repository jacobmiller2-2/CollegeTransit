//
//  ContentView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/1/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//
import MapKit
import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        //MapView().edgesIgnoringSafeArea(.all)
        //RouteListView()
        TabView{
            MapView()
                .edgesIgnoringSafeArea(.top)
                .tabItem{
                    
                Image(systemName: "1.square.fill")
                Text("Map View")
            }
            
            BusListView()
                .tabItem{
                    Image(systemName: "2.square.fill")
                    Text("Bus List")
            }
            RouteListView()
                .tabItem{
                    Image(systemName: "2.square.fill")
                    Text("Route List")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
