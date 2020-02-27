//
//  MapContainer.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/27/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI
import MapKit

struct MapContainer: View {
    
    @State var annotations = [MKPointAnnotation]()
    @EnvironmentObject var bFetcher: BusFetcher
    @EnvironmentObject var uPrefs: UPrefDelegate
    
    @State var starredOnly = false;
    
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
        
        
        ZStack{
            
            MapView(annotations: $annotations, starredOnly: $starredOnly)
            VStack{
                HStack{
                    if starredOnly {
                        Image(systemName: "star.fill")
                        .imageScale(.large)
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .imageScale(.large)
                    }
                    Spacer()
                }.onAppear(){
                    if (self.uPrefs.showStarredOnStartup){
                        self.starredOnly = true;
                    }
                }
                    .onTapGesture {
                        self.starredOnly.toggle()
                }
                .padding(.horizontal)
                Spacer()
            }.padding(.top, 50)
            
            
        }
        
    
        .onReceive(bFetcher.objectWillChange) {
            self.updateAnnotations()
        }
    }
}

struct MapContainer_Previews: PreviewProvider {
    static var previews: some View {
        MapContainer()
    }
}
