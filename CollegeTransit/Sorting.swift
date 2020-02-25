//
//  Sorting.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/25/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

class Sorting {
    
    
    let sortOrders = [1: sortAscendingKey, 2: sortDescendingKey]
    let sortTypes = [1: sortAlpabeticKey]
    
    
    func getSortOrder() -> SortOrders {
        return SortOrders.ascending
    }
    
    static func sort<T: Comparable>(object: [T], by: SortOrders) -> [T] {
        var sorted: [T]
        
        switch by {
            case .descending:
                sorted = object.sorted(by: >)
                
            default:
                sorted = object.sorted(by: <)
        }
        return sorted
    }
    
    static func cycleSortOrder<T: Comparable>(object: [T], currentOrder: SortOrders) -> ([T], SortOrders) {
        var newOrder: SortOrders
        var sorted: [T]
        
        switch currentOrder {
            case .descending:
                newOrder = .ascending
                sorted = object.sorted(by: <)
                
            default:
                newOrder = .descending
                sorted = object.sorted(by: >)
        }
        return (sorted, newOrder)
    }
    
    func cycleSortType(){
        
    }
    
    enum SortTypes {
        case alphabetic
        
    }
    
    enum SortOrders {
        case ascending
        case descending
        
        func toString() -> String{
            switch self {
                case .descending:
                    return "Descending"
                default:
                    return "Ascending"
            }
            
        }

    }
    
}
