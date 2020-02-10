//
//  Bus.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/1/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation
import CoreLocation


class BusNetwork: Decodable {
    let success: Bool?
    let message: String?
    let messages: String?
    let data : [Bus]
}

class Bus: Decodable, Identifiable {
    var id: String
    var routeId: String // matches route shortName
    var patternName: String
    //var latitude: Double?
    //var longitude: Double?
    
}
