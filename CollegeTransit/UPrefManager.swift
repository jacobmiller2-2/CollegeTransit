//
//  UPrefManager.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/25/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation





class UPrefManager: ObservableObject {
    
    
    
    static let s = UPrefManager()
    
    let prefs = UserDefaults.standard
    
    private init(){
        if prefs.object(forKey: existsKey) == nil {
            // Create defaults
            prefs.set(true, forKey: existsKey)
            
            
        }
    }
    
    
    
    
    
}
