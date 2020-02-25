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
  
    @State var currentOrder = Sorting.SortOrders.ascending
    @State var buses: [Bus]
    
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
                    
                    List(buses) { bus in
                        VStack (alignment: .leading) {
                            HStack{
                                Text(bus.patternName)
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                                Spacer()
                                Text("\(bus.id)")
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }.onReceive(busGetter.objectWillChange) {
                        self.buses = Sorting.sort(object: self.busGetter.buses, by: self.currentOrder)
                    }
                    
                }
            }
        }.padding(.horizontal)// End VStack
            
        
        
    }
}
