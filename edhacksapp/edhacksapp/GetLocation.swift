//
//  GetLocation.swift
//  edhacksapp
//
//  Created by Muhammad Hariz on 1/26/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import UIKit
import CoreLocation

class GetLocation: UIViewController, CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    

    let locationManager = CLLocationManager()
    let client = MSClient(applicationURLString: "https://edhacksapp.azurewebsites.net")
    var pickerData: [String] = ["accounting", "airport","amusement park","aquarium", "art gallery","atm","bakery","bank","bar","beauty salon","bicycle store","book store","bowling alley","bus station","cafe","campground","car dealer","car rental","car repair","car wash","casino","cemetery","church","city hall","clothing store","convenience store","courthouse","dentist","department store","doctor","electrician","electronics store","embassy","fire station","florist","funeral home","furniture store","gas station","gym", "hair_care","hardware store","hindu temple","home goods store","hospital", "insurance agency","jewelry store","laundry","lawyer","library","liquor store","local government_office","locksmith","lodging","meal delivery","meal takeaway","mosque","movie rental","movie theater","moving company","museum", "night club", "painter","park","parking","pet store","pharmacy", "physiotherapist","plumber","police","post office","real estate agency", "restaurant", "roofing contractor", "rv park","school","shoe store","shopping mall","spa","stadium","storage","store","subway station","supermarket", "synagogue","taxi stand", "train station", "transit station", "travel agency","veterinary care","zoo"]
    
    @IBOutlet weak var locationDial: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.requestWhenInUseAuthorization()
         //Do any additional setup after loading the view.
        
//        self.locationDial.delegate = self as UIPickerViewDelegate
//        self.locationDial.dataSource = self as! UIPickerViewDataSource
//        
//        
        
        pickerData = ["accounting", "airport","amusement park","aquarium", "art gallery","atm","bakery","bank","bar","beauty salon","bicycle store","book store","bowling alley","bus station","cafe","campground","car dealer","car rental","car repair","car wash","casino","cemetery","church","city hall","clothing store","convenience store","courthouse","dentist","department store","doctor","electrician","electronics store","embassy","fire station","florist","funeral home","furniture store","gas station","gym", "hair_care","hardware store","hindu temple","home goods store","hospital", "insurance agency","jewelry store","laundry","lawyer","library","liquor store","local government_office","locksmith","lodging","meal delivery","meal takeaway","mosque","movie rental","movie theater","moving company","museum", "night club", "painter","park","parking","pet store","pharmacy", "physiotherapist","plumber","police","post office","real estate agency", "restaurant", "roofing contractor", "rv park","school","shoe store","shopping mall","spa","stadium","storage","store","subway station","supermarket", "synagogue","taxi stand", "train station", "transit station", "travel agency","veterinary care","zoo"]
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
            print("location worked")
            print("\(lat),\(long)")
            
           // sendQuery()
            
            print("stop 1")
            let tblObject = client.table(withName: "tblObject")
            let tblCoordinate = client.table(withName: "tblCoordinate")
            
//            var qResult: Int = 0
//            let query = tblObject.query()
//            query.selectFields = ["locationTypeID", "complete"]
//            query.parameters = ["locationTypeName": "accounting"]
//            query.read { (result, error) in
//                if let err = error {
//                    print("ERROR ", err)
//                } else if let items = result?.items {
//                    for item in items {
//                        qResult = item
//                    }
//                }
//            }


            let newObject = ["objectTypeID": 1, "locationTypeID": 1]
            print("stop 4")

            let newCoordinate = ["objectID": 1,"long": long, "lat": lat]
            print("stop 5")


            tblObject.insert(newObject) { (result, error) in
                if let err = error {
                    
                    print("ERROR ", err)
                } else if let item = result {
                    //print("Todo Item: ", item["text"]!)
                }
            }
            tblCoordinate.insert(newCoordinate) { (result, error) in
                if let err = error {
                    print("ERROR ", err)
                } else if let item = result {
                }
            }
//
            
            
        } else {
            print("No coordinates")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    @IBOutlet weak var locationTypeName: UITextField!
    @IBAction func getGPSLocation(_ sender: Any) {
        
        locationManager.requestLocation()
    }
    
}


