//
//  BusView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/25/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct BusView: View {
    
    @EnvironmentObject var uPrefs: UPrefDelegate
    @State var showDetail = false;
    var bus: Bus
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(bus.patternName)
                    .font(.headline)
                    .foregroundColor(Color.gray)
                Spacer()
                VStack{
                    if (uPrefs.starredRoutes.contains(bus.routeId)){
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.systemYellow)
                    }
                }
            }
            if(showDetail){
                VStack(alignment: .leading){
                     HStack{
                        Text("Route:")
                        Spacer()
                        Text("\(bus.routeId)")
                    }
                    HStack{
                        Text("Passengers:")
                        Spacer()
                        Text("\(bus.passengers!)")
                    }
                    HStack{
                        Text("Stop ID:")
                        Spacer()
                        Text("\(bus.stopId)")
                    }
                    HStack{
                        Text("ID:")
                        Spacer()
                        Text("\(bus.id)")
                    }
                    
                }
                .font(.caption)
                .foregroundColor(Color.gray)
            }
        }
        .onTapGesture{
            self.showDetail.toggle()
        }
        .animation(.spring(response: 0.01, dampingFraction: 1, blendDuration: 1))

        
    }
}

