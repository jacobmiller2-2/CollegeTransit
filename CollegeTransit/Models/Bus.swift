//
//  Bus.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/1/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation
import CoreLocation


struct BusNetwork: Decodable {
    let success: Bool?
    let message: String?
    let messages: String?
    var data : [Bus]
}

struct Bus: Decodable, Identifiable, Comparable {
    static func < (lhs: Bus, rhs: Bus) -> Bool {
        return lhs.routeId < rhs.routeId
    }

    
    static func == (lhs: Bus, rhs: Bus) -> Bool {
        return lhs.routeId == rhs.routeId
    }
    
    var id: String
    var routeId: String // matches route shortName
    var patternName: String
    var stopId: String
    var states: [BusState]?
    var latitude: Double?
    var longitude: Double?
    var passengers: Int?
    
    var isStarred: Bool?
}

struct BusState: Decodable {
    var latitude: Double?
    var longitude: Double?
    var passengers: Int?
}
