//
//  MapViewController.swift
//  Kanto
//
//  Created by Anna KULAIEVA on 10/8/19.
//  Copyright © 2019 Anna KULAIEVA. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MyPointAnnotation: NSObject, MKAnnotation
{
    let identifier : String
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let color: UIColor
    
    init(identifier: String, title: String, subtitle: String, coordinate: CLLocationCoordinate2D, color: UIColor)
    {
        self.identifier = identifier
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.color = color
        super.init()
    }
}

class MapViewController: ViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var locationData: [Location]!
    var locationNum: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.mapType = .standard
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        locationNum = (self.tabBarController as! TabBarDataVC).placeNum
        locationData = (self.tabBarController as! TabBarDataVC).placesList
        let latitude = locationData[locationNum].latitude
        let longitude = locationData[locationNum].longitude
        let title = locationData[locationNum].title
        let pinLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let subtitleLocation = CLLocation(latitude: latitude, longitude: longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(subtitleLocation, completionHandler: { (placemarks, error) in
            if error == nil {
                var address: String = ""
                address = (placemarks?[0].locality)! + ", "
                address += (placemarks?[0].name)!
                let annotation = MyPointAnnotation(identifier: title, title: title, subtitle: address, coordinate: pinLocation, color: self.locationData[self.locationNum].color)
                self.placePin(annotation: annotation)
            }
            else {
                print("An error occurred during geocoding.")
            }
        })
    }
    
    func placePin(annotation: MyPointAnnotation) {
        let annotation = annotation
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let newRegion = MKCoordinateRegionMake(annotation.coordinate, span)
        mapView.region = newRegion
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MyPointAnnotation
        {
            let identifier = annotation.identifier
            if (identifier != "current") {
                let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.animatesDrop = true
                view.pinTintColor = annotation.color
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                return view
            }
            else {
                let view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.image = UIImage(named: "currentLocation")
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                return view
            }
        }
        return nil
    }
    
    @IBAction func changedMapType(_ sender: UISegmentedControl) {
        let currentSegment: Int = sender.selectedSegmentIndex
        mapView.mapType = MKMapType(rawValue: UInt(currentSegment))!
    }
    
    @IBAction func geolocalize(_ sender: UIButton) {
        var currentLocation: CLLocationCoordinate2D
        if let lastLocation = self.locationManager.location {
            currentLocation = lastLocation.coordinate
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(lastLocation, completionHandler: { (placemarks, error) in
                if error == nil {
                    var address: String = ""
                    address = (placemarks?[0].locality)! + ", "
                    address = address + (placemarks?[0].name)!
                    let annotation = MyPointAnnotation(identifier: "current", title: "Current Location", subtitle: address, coordinate: currentLocation, color: .red)
                    self.placePin(annotation: annotation)
                }
                else {
                    print("An error occurred during geocoding.")
                }
            })
        }
        else {
            print("An error occurred during geocoding.")
            return
        }
    }
}
