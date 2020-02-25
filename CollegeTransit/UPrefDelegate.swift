//
//  UPrefDelegate.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/25/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

class UPrefDelegate: ObservableObject {
    
    @Published var currSortOrder: Sorting.SortOrders = Sorting.SortOrders.ascending
    
    
}
