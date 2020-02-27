//
//  RouteView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/26/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct RouteView: View {
    
    @EnvironmentObject var uPrefs: UPrefDelegate
    @State var showDetail = false;
    var route: Route
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("\(route.id!)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Spacer()
                VStack{
                    if (uPrefs.starredRoutes.contains(route.routeShortName!)){
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.systemYellow)
                    } else {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.tertiaryLabel)
                    }
                }.onTapGesture {
                    if let i = self.uPrefs.starredRoutes.firstIndex(of: self.route.routeShortName!) {
                        self.uPrefs.starredRoutes.remove(at: i)
                    } else {
                        self.uPrefs.starredRoutes.append(self.route.routeShortName!)
                    }
                }
            }
            if (showDetail){
                VStack(alignment: .leading) {
                    HStack{
                        Text("ha")
                    }
                }
            }
        }
    }
}
