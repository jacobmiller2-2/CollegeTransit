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
    var body: some View {
        VStack(alignment: .leading) {
            if(fetcher.routes.count == 0){
                VStack{
                    Image("route").resizable().frame(width: 180, height: 180)
                    Text("No Data!").font(.largeTitle).fontWeight(.heavy)
                    Text("Sorry, but we can't connect you to the server").multilineTextAlignment(.center).lineLimit(5).font(.subheadline).foregroundColor(Color.secondaryLabel).padding()
                    Text("Please try again later").fontWeight(.medium)
                }
            } else {
                Text("Routes").font(.headline)
                
                List(fetcher.routes) { route in
                    VStack (alignment: .leading) {
                        Text("\(route.id ?? "No routes at this time")")    
                            .font(.system(size: 11))
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }.padding(.horizontal)//End VStack
    }
}

struct RouteListView_Previews: PreviewProvider {
    static var previews: some View {
        RouteListView()
    }
}
