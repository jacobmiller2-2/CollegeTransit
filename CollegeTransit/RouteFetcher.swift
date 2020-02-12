//
//  RouteFetcher.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/10/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

public class RouteFetcher: ObservableObject {
    @Published var routes = [Route]()
    
    init(){
        load()
    }
    
    func load(){
        let url = URL(string: "https://ridebt.org/index.php?option=com_ajax&module=bt_map&method=getRoutes&format=json&Itemid=101")!
        URLSession.shared.dataTask(with: url) {
            (data: Data?, response: URLResponse?, error: Error?) in
            // check errors
            if let error = error {
                print("ERROR: Retrieving Routes:\n\(error.localizedDescription)")
            }
            
            // check response
            guard response != nil else {
                print("No response")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
                
            }
        
            do {
                //Decodes data
                let transitSystem = try JSONDecoder().decode(TransitSystem.self, from: data)
                // further process data
                DispatchQueue.main.async {
                    for routeData in transitSystem.data!{
                        
                        self.routes.append(routeData.value[0])
                    }
                    print("Routes retrieved")
                    print("Timestamp: \(Date().timeIntervalSinceReferenceDate * 1000)")
                }

            } catch let jsonError{
                print("Error with json: ", jsonError)
            }
        }.resume()
    }
}
