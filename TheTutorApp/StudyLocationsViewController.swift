//
//  StudyLocationsViewController.swift
//  TheTutorApp
//
//  Created by Erica Roy on 7/10/17.
//  Copyright © 2017 Erica Roy. All rights reserved.
//

import UIKit
import MapKit

class StudyLocationsViewController: UIViewController {

    @IBOutlet weak var mapLocations: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocationCoordinate2D(
            latitude: 34.722426, longitude: -92.338982)
        
        let coords = MKCoordinateSpanMake(0.05,0.05)
        let region = MKCoordinateRegion(center: location, span: coords)
        mapLocations.setRegion(region, animated: true)
        
        let annot = MKPointAnnotation()
        annot.coordinate = location
        annot.title = "UA-Little Rock"
        mapLocations.addAnnotation(annot)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
