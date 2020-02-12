//
//  RouteListView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/10/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct RouteListView: View {
    @ObservedObject var fetcher = RouteFetcher()
    
    var body: some View {
        VStack {
            List(fetcher.routes) { route in
                VStack (alignment: .leading) {
                    Text("\(route.id ?? "No routes at this time")")
                    
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

struct RouteListView_Previews: PreviewProvider {
    static var previews: some View {
        RouteListView()
    }
}
