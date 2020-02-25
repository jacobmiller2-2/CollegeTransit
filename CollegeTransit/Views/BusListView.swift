//
//  List.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/10/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI
import Combine

struct BusListView: View {

    @EnvironmentObject var busGetter: BusFetcher
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if(busGetter.buses.isEmpty){
                Image("bus")
                Text("No Data!").font(.largeTitle).fontWeight(.heavy)
                Text("Either we can't connect you to the server or there aren't any buses operating").multilineTextAlignment(.center).lineLimit(5).font(.subheadline).foregroundColor(Color.secondaryLabel).padding().padding(.horizontal, 30)
                Text("Please try again later").fontWeight(.medium)
            } else {
                
                Text("Number of Buses: \(busGetter.buses.count)").font(.headline)
                
                List(busGetter.buses) { bus in
                    VStack (alignment: .leading) {
                        Text(bus.patternName)
                            .font(.system(size: 11))
                            .foregroundColor(Color.gray)
                    }
                }
            }

        }.padding(.horizontal)// End VStack
            
        
        
    }
}

struct BusListView_Previews: PreviewProvider {
    static var previews: some View {
        BusListView()
    }
}
