//
//  UPrefDelegate.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/25/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

class UPrefDelegate: ObservableObject {
    
    @Published var starredRoutes: [String] = UPrefManager.s.getStarredRoutes()
    @Published var mapCompassEnabled = UPrefManager.s.getMapCompassEnabled()
    @Published var mapTrafficEnabled = UPrefManager.s.getMapTrafficEnabled()
    @Published var mapAllowPitchEnabled = UPrefManager.s.getMapAllowPitchEnabled()
    @Published var showStarredOnStartup = UPrefManager.s.getShowStarredOnStartup();
}
