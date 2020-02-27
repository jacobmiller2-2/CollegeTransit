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
    
    @EnvironmentObject var fetcher: BusFetcher
    @EnvironmentObject var uPrefs: UPrefDelegate
    @Binding var annotations: [MKPointAnnotation]
    @Binding var starredOnly: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        mapView.showsUserLocation = true
        let locationManager = CLLocationManager()
        let status = CLLocationManager.authorizationStatus()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()

        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            let location: CLLocationCoordinate2D = locationManager.location!.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
        
        mapView.showsCompass = uPrefs.mapCompassEnabled
        mapView.showsTraffic = uPrefs.mapTrafficEnabled
        mapView.mapType = MKMapType.mutedStandard
        mapView.isPitchEnabled = uPrefs.mapAllowPitchEnabled
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        let allAnnotations = view.annotations
        view.removeAnnotations(allAnnotations)
        
        if (starredOnly){
            var starredAnnotations = [MKPointAnnotation]()
            for annotation in annotations{
                if uPrefs.starredRoutes.contains(annotation.title!){
                    starredAnnotations.append(annotation)
                }
            }
            view.addAnnotations(starredAnnotations)
        } else {
            view.addAnnotations(annotations)
        }
        
    }
    
}
