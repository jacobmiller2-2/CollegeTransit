//
//  MapView.swift
//  CollegeTransit
//
//  Created by Jacob Miller on 2/1/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @ObservedObject var fetcher = BusFetcher()
    private let mapView = MKMapView()
    
    private func makeAnnotations() -> [MKPointAnnotation]{
        var annotations = [MKPointAnnotation]()
     
        for bus in fetcher.buses{
            // annotation array
            let annotation = MKPointAnnotation()
            
            annotation.title = bus.patternName
            annotation.subtitle = bus.id
            annotation.coordinate = CLLocationCoordinate2D(latitude: bus.latitude!, longitude: bus.longitude!)
            
            // append to array
            annotations.append(annotation)
        }
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        //let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        print(view.userLocation)
        
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        print("Map is updating")
        
        // Adds annoations
        for annotation in makeAnnotations(){
            view.addAnnotation(annotation)
        }
    }
    
    
    
    func makeCoordinator() -> Coordinator{
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        var parent: MapView
        init(_ parent: MapView){
            self.parent = parent
            
            
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
            
            let identifier = "bus"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if (annotationView == nil){
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                let originalImage = UIImage(named: "bus")!
                let resizedImage = UIImage.resizeImage(image: originalImage, newWidth: 15)
                annotationView?.image = resizedImage
                
                
                //annotationView?.rightCalloutAccessoryView =
            } else {
                annotationView?.annotation = annotation
            }
            
            annotationView?.canShowCallout = true
            
            return annotationView
        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


extension UIImage {

    class func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {

        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
