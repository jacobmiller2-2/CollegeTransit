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
            
            prefs.set([String](), forKey: starredRoutesKey)
            prefs.set(false, forKey: mapScaleEnabledKey)
            prefs.set(true, forKey: mapTrafficEnabledKey)
            prefs.set(false, forKey: mapAllowPitchEnabledKey)
        }
    }
    
    func getStarredRoutes() -> [String] {
        let emptyString = [String]()
        return prefs.array(forKey: starredRoutesKey) as? [String] ?? emptyString
    }
    
    func setStarredRoutes(routes: [String]) -> Void {
        /*
        var string = [String]()
        
        for route in routes{
            string.append(route.routeShortName ?? "Err")
        }
        */
        
        prefs.set(routes, forKey: starredRoutesKey)
    }
    
    func setMapScaleEnabled(isOn: Bool){
        prefs.set(isOn, forKey: mapScaleEnabledKey)
    }
    
    func getMapScaleEnabled() -> Bool{
        return prefs.bool(forKey: mapScaleEnabledKey)
    }
    
    func setMapTrafficEnabled(isOn: Bool){
        prefs.set(isOn, forKey: mapTrafficEnabledKey)
    }
    
    func getMapTrafficEnabled() -> Bool{
        return prefs.bool(forKey: mapTrafficEnabledKey)
    }
    
    func setMapAllowPitchEnabled(isOn: Bool){
        prefs.set(isOn, forKey: mapAllowPitchEnabledKey)
    }
    
    func getMapAllowPitchEnabled() -> Bool{
        return prefs.bool(forKey: mapAllowPitchEnabledKey)
    }
    
    
}
