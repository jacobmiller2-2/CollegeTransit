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

struct Bus: Decodable, Identifiable {
    var id: String
    var routeId: String // matches route shortName
    var patternName: String
    var states: [BusState]?
    var latitude: Double?
    var longitude: Double?
}

struct BusState: Decodable {
    var latitude: Double?
    var longitude: Double?
}