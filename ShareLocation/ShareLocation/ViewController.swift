//
//  ViewController.swift
//  ShareLocation
//
//  Created by Ziwen Wang on 2019/3/22.
//  Copyright © 2019年 Ziwen Wang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var centerLocation = CLLocationCoordinate2DMake(-27, 153)
        var mapSpan = MKCoordinateSpanMake(0.01, 0.01)
        var mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        self.map.setRegion(mapRegion, animated: true)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

