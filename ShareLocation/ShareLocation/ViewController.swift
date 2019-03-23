//
//  ViewController.swift
//  FoodTracker
//
//  Created by Ziwen Wang on 2019/3/22.
//  Copyright © 2019年 Ziwen Wang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    let locationManger = CLLocationManager()
    var movedToUserLocation = false
    @IBOutlet weak var MKMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        var centerLocation = CLLocationCoordinate2DMake(-27, 153)
        var mapSpan = MKCoordinateSpanMake(0.01, 0.01)
        var mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        self.MKMapView.setRegion(mapRegion, animated: true)MKMapView.delegate = self
 */
        MKMapView.delegate = self
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        /*
        self.LocationManger.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            
            LocationManger.delegate = self
            LocationManger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            LocationManger.startUpdatingLocation()
        }
        
        */
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .denied, .restricted:
            print("acces denied or restricted")
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            manager.startUpdatingLocation()
            
        }
    }
    /*func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    
        if !movedToUserLocation {
            mapView.region.center = mapView.userLocation.coordinate
            movedToUserLocation = true
        }
    }*/
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude)\(locValue.longitude)")
        let userlocation = locations.last
        let viewRegion =  MKCoordinateRegionMakeWithDistance((userlocation?.coordinate)!, 600, 600)
        self.MKMapView.setRegion(viewRegion, animated: true)
    }
    
}

