//
//  BusFetcher.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/10/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

public class BusFetcher: ObservableObject {
    @Published var buses = [Bus]()
    
    init(){
        load()
    }
    
    
    func load(){
        
         // Gets bus data
         let url = URL(string: "http://ridebt.org/index.php?option=com_ajax&module=bt_map&method=getBuses&format=json&Itemid=101")!
         
        
         URLSession.shared.dataTask(with: url) {
             
             (data: Data?, response: URLResponse?, error: Error?) in
             // check errors
             if let error = error {
                 print("ERROR: Retrieving Buses:\n\(error.localizedDescription)")
             }
             
             // check response
             guard response != nil else {
                 print("No response")
                 return
             }
             
             guard let data = data else { return }
             
             do {
                 //Decodes data
                 let busData = try JSONDecoder().decode(BusNetwork.self, from: data)
                 // further process data
                
                DispatchQueue.main.async {
                    var newBuses = [Bus]()
                    for var bus in busData.data {
                        bus.latitude = bus.states![0].latitude!
                        bus.longitude = bus.states![0].longitude!
                        bus.passengers = bus.states![0].passengers!

                        newBuses.append(bus)
                    }
                    newBuses.sort()
                    self.buses = newBuses
                    
                    print("Buses retrieved:\n\tTimestamp: \(Date().timeIntervalSinceReferenceDate * 1000)")
                }
                 
             } catch let jsonError{
                 print("Error with json: ", jsonError)
             }
         }.resume()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
            self.load()
        }
    }
}
