//
//  searchHostMapVC.swift
//  iOsBmoby
//
//  Created by Magomed Souleymnov on 23/09/2016.
//  Copyright © 2016 BMoby. All rights reserved.
//

import UIKit
import MapKit

var searches = [[String]]()


class searchHostMapVC: UIViewController {

    @IBOutlet weak var hostsMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coord1 = ["48.580757","7.780134"] //48.580757, 7.780134
        let coord2 = ["48.581580","7.771079"] //48.581580, 7.771079
        let coord3 = ["48.583141","7.775457"] //48.583141, 7.775457
        let coord4 = ["48.575589","7.788117"] //48.575589, 7.788117
        let coord5 = ["48.588024","7.770436"] //48.588024, 7.770436
        let coord6 = ["48.582517","7.767002"] //48.582517, 7.767002
        
        searches.append(coord1)
        searches.append(coord2)
        searches.append(coord3)
        searches.append(coord4)
        searches.append(coord5)
        searches.append(coord6)
        
        // Do any additional setup after loading the view.
        findHosts()
    }

    func findHosts(){
        
        for search in searches {
            // COORDINATES
            let hostLat = (search[0] as NSString).doubleValue
            let hostLong = (search[1] as NSString).doubleValue
            let hostCoordinate = CLLocationCoordinate2D(latitude: hostLat, longitude: hostLong)
            
            let span = MKCoordinateSpanMake(0.075, 0.075)
            
            let hostPosition = MKCoordinateRegion(center: hostCoordinate, span: span)
            
            hostsMap.setRegion(hostPosition, animated: true)
            
            let pointOnMap = MKPointAnnotation()
            pointOnMap.title = "Host Name Here"
            pointOnMap.subtitle = "About the listing info and button to transite on the listing view"
            pointOnMap.coordinate = hostCoordinate
            
            hostsMap.addAnnotation(pointOnMap)
            
        }
        
    }
}
