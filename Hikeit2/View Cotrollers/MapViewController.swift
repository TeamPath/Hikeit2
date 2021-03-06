//
//  MapViewController.swift
//  PolylineTest2
//
//  Created by Riley Osborne on 11/16/16.
//  Copyright © 2016 Riley Osborne. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var previousLocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        // user activated automatic authorization info mode
        let status = CLLocationManager.authorizationStatus()
        if status == .notDetermined || status == .denied || status == .authorizedWhenInUse {
            // present an alert indicating location authorization required
            // and offer to take the user to Settings for the app via
            // UIApplication -openUrl: and UIApplicationOpenSettingsURLString
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        
        
        //mapview setup to show user location
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = MKMapType.hybrid
        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        mapView.mapType = MKMapType(rawValue: 0)!
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.startUpdatingHeading()
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingHeading()
        locationManager.stopUpdatingLocation()
    }
    
    // MARK :- CLLocationManager delegate
    func locationManager(_ manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        
        //println("present location : \(newLocation.coordinate.latitude),\(newLocation.coordinate.longitude)")
        
        //drawing path or route covered
        if let oldLocationNew = oldLocation as CLLocation?{
            let oldCoordinates = oldLocationNew.coordinate
            let newCoordinates = newLocation.coordinate
            var area = [oldCoordinates, newCoordinates]
            let polyline = MKPolyline(coordinates: &area, count: area.count)
            mapView.add(polyline)
        }
        
        
        //calculation for location selection for pointing annoation
        if (previousLocation as CLLocation?) != nil{
            //case if previous location exists
            if previousLocation.distance(from: newLocation) > 10 {
                addAnnotationsOnMap(newLocation)
                previousLocation = newLocation
            }
        }else{
            //case if previous location doesn't exists
            addAnnotationsOnMap(newLocation)
            previousLocation = newLocation
        }
    }
    
    // MARK :- MKMapView delegate
    func mapView(_ mapView: MKMapView!, rendererFor overlay: MKOverlay!) -> MKOverlayRenderer! {
        
        if (overlay is MKPolyline) {
            let pr = MKPolylineRenderer(overlay: overlay)
            pr.strokeColor = UIColor(red:0.18, green:0.46, blue:0.09, alpha:1.0)
            pr.lineWidth = 3
            return pr
        }
        
        return nil
    }
    
    //function to add annotation to map view
    func addAnnotationsOnMap(_ locationToPoint : CLLocation){
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationToPoint.coordinate
        
        let geoCoder = CLGeocoder ()
        geoCoder.reverseGeocodeLocation(locationToPoint, completionHandler: { (placemarks, error) -> Void in
            if let validPlacemark = placemarks?[0]{
                let placemark = validPlacemark as? CLPlacemark;
                var addressDictionary = placemark?.addressDictionary;
                annotation.title = addressDictionary?["Name"] as? String
                self.mapView.addAnnotation(annotation)
            }
            //            if let placemarks = placemarks as? [CLPlacemark], placemarks.count > 0 {
            //                let placemark = placemarks[0]
            //                var addressDictionary = placemark.addressDictionary;
            //                annotation.title = addressDictionary["Name"] as? String
            //                self.mapView.addAnnotation(annotation)
            //            }
        })
    }
    
}
