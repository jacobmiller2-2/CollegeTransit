//
//  List.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/10/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct BusListView: View {

    @EnvironmentObject var busGetter: BusFetcher
    @EnvironmentObject var uPrefs: UPrefDelegate
    
    @State var currentOrder = Sorting.SortOrders.ascending
    @State var buses: [Bus]
    
    @State var starredOnly = false;
    
    var body: some View {
        VStack {
            if(buses.isEmpty){
                VStack{
                    Image("bus")
                    Text("No Data!").font(.largeTitle).fontWeight(.heavy)
                    Text("Either we can't connect you to the server or there aren't any buses operating").multilineTextAlignment(.center).lineLimit(5).font(.subheadline).foregroundColor(Color.secondaryLabel).padding().padding(.horizontal, 30)
                    Text("Please try again later").fontWeight(.medium)
                }
            } else {
                VStack(alignment: .leading){
                    HStack{
                        Text("Number of Buses: \(buses.count)").font(.headline)
                        Spacer()
                        Button(action: {
                            let signal = Sorting.cycleSortOrder(object: self.buses, currentOrder: self.currentOrder)
                            self.currentOrder = signal.1
                            self.buses = signal.0
                            
                        }){
                            Text(currentOrder.toString())
                        }
                        
                    }
                    
                    Toggle(isOn: $starredOnly){
                        Text("Show Starred Buses Only")
                    }
                    List{
                        
                        ForEach(buses) { bus in
                            
                            if !self.starredOnly || self.uPrefs.starredRoutes.contains(bus.routeId){
                                VStack (alignment: .leading) {
                                    BusView(bus: bus)
                                }
                            }
                        }
                    }
                    .onReceive(busGetter.objectWillChange) {
                        self.buses = Sorting.sort(object: self.busGetter.buses, by: self.currentOrder)
                    }
                }
            }
        }.padding(.horizontal)// End VStack
            
        
        
    }
}
