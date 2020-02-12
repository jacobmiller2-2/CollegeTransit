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
    @ObservedObject var fetcher = BusFetcher()
    
    
    var body: some View {
        
        VStack {
            List(fetcher.buses) { bus in
                VStack (alignment: .leading) {
                    Text(bus.patternName)
                    
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            
                
            }
        }
            
        
        
    }
}

struct BusListView_Previews: PreviewProvider {
    static var previews: some View {
        BusListView()
    }
}
