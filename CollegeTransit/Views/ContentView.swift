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
    
    @EnvironmentObject var bFetcher: BusFetcher
    @EnvironmentObject var rFetcher: RouteFetcher
    @State var annotations = [MKPointAnnotation]()
    
    func updateAnnotations() -> Void {
        // If not empty, remove all entries, but keep storage
        if(!annotations.isEmpty){
            annotations.removeAll(keepingCapacity: true)
        }
        
        for bus in bFetcher.buses{
            // create annotation
            let annotation = MKPointAnnotation()
            
            annotation.title = bus.routeId
            annotation.subtitle = bus.patternName
            annotation.coordinate = CLLocationCoordinate2D(latitude: bus.latitude!, longitude: bus.longitude!)
            
            // append to array
            annotations.append(annotation)
        }
    }
    
    var body: some View {
    
        TabView{
            MapView(annotations: $annotations).edgesIgnoringSafeArea(.top)
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
                    Image(systemName: "2.square.fill")
                    Text("Route List")
                }
        }
        .edgesIgnoringSafeArea(.top)
        .onReceive(bFetcher.objectWillChange) {
            self.updateAnnotations()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
