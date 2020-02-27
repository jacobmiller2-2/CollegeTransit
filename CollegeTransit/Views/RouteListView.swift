//
//  RouteListView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/10/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct RouteListView: View {
    @EnvironmentObject var fetcher: RouteFetcher
    
    @State var currentOrder = Sorting.SortOrders.ascending
    @State var routes: [Route]
    
    var body: some View {
        VStack{
            if(routes.isEmpty){
                VStack{
                    Image("route").resizable().frame(width: 180, height: 180)
                    Text("No Data!").font(.largeTitle).fontWeight(.heavy)
                    Text("Sorry, but we can't connect you to the server").multilineTextAlignment(.center).lineLimit(5).font(.subheadline).foregroundColor(Color.secondaryLabel).padding()
                    Text("Please try again later").fontWeight(.medium)
                }
            } else {
                VStack(alignment: .leading){
                    HStack{
                        Text("Routes").font(.headline)
                        Spacer()
                        Button(action: {
                            let signal = Sorting.cycleSortOrder(object: self.routes, currentOrder: self.currentOrder)
                            self.currentOrder = signal.1
                            self.routes = signal.0
                            
                        }){
                            Text(currentOrder.toString())
                        }
                    }
                    
                    List {
                        
                        ForEach(routes) { route in
                            VStack (alignment: .leading) {
                                RouteView(route: route)
                            }
                        }
                        
                    }.onReceive(fetcher.objectWillChange) {
                        self.routes = Sorting.sort(object: self.fetcher.routes, by: self.currentOrder)
                    }
                }
            }
        }.padding(.horizontal)//End VStack
    }
}
