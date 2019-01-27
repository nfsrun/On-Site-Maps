//
//  GetLocation.swift
//  edhacksapp
//
//  Created by Muhammad Hariz on 1/26/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import UIKit
import CoreLocation

class GetLocation: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let client = MSClient(applicationURLString: "https://edhacksapp.azurewebsites.net")
    @IBOutlet weak var locationDial: UIPickerView!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self as! CLLocationManagerDelegate
        locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
        //self.locationDial.delegate = self
        //self.locationDial.dataSource = self
        pickerData = ["accounting", "airport","amusement park","aquarium", "art gallery","atm","bakery","bank","bar","beauty salon","bicycle store","book store","bowling alley","bus station","cafe","campground","car dealer","car rental","car repair","car wash","casino","cemetery","church","city hall","clothing store","convenience store","courthouse","dentist","department store","doctor","electrician","electronics store","embassy","fire station","florist","funeral home","furniture store","gas station","gym", "hair_care","hardware store","hindu temple","home goods store","hospital", "insurance agency","jewelry store","laundry","lawyer","library","liquor store","local government_office","locksmith","lodging","meal delivery","meal takeaway","mosque","movie rental","movie theater","moving company","museum", "night club", "painter","park","parking","pet store","pharmacy", "physiotherapist","plumber","police","post office","real estate agency", "restaurant", "roofing contractor", "rv park","school","shoe store","shopping mall","spa","stadium","storage","store","subway station","supermarket", "synagogue","taxi stand", "train station", "transit station", "travel agency","veterinary care","zoo"]
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
            print("location worked")
            print("\(lat),\(long)")
            
            sendQuery()
            
//            print("stop 1")
//            let tblObject = client.table(withName: "dbo.tblObject")
//            print("stop 2")
//            let tblObjectType = client.table(withName: "TodoItem")
//
//            tblObjectType.read { (result, error) in
//                if let err = error {
//                    print("ERROR ", err)
//                } else if let items = result?.items {
//                    for item in items {
//                        print("Todo Item: ", item["text"])
//                    }
//                }
//            }
//
//
//            let tblCoordinate = client.table(withName: "dbo.tblCoordinate")
//            print("stop 3")
//
//
//            let newObject = ["objectTypeID": 1, "locationTypeID": 1]
//            print("stop 4")
//
//            let newCoordinate = ["objectID": 1, "long": long, "lat": lat]
//            print("stop 5")
//
//
//            tblObject.insert(newObject) { (result, error) in
//                if let err = error {
//                    print("ERROR ", err)
//                } else if let item = result {
//                    print("Todo Item: ", item["text"]!)
//                }
//            }
//            tblCoordinate.insert(newCoordinate) { (result, error) in
//                if let err = error {
//                    print("ERROR ", err)
//                } else if let item = result {
//                    print("Todo Item: ", item["text"]!)
//                }
//            }
            
            
            
        } else {
            print("No coordinates")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
//    func sendQuery() {
//        print("hi")
//        let url = URL(string: "hexadecimal-knocks.000webhostapp.com/db.php")!
//        var request = URLRequest(url: url)
//
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "GET"
//        let postString = "SELECT * FROM tblObjectType"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                // check for fundamental networking error
//                print(error!)
//                print("error")
//                return
//            }
//            print("itworked")
//            print(data)
//        }
//        print("end")
//
//    }
    
    func sendQuery() {
        print("hi")
        let url = URL(string: "hexadecimal-knocks.000webhostapp.com/dbv3.php")!
        var request = URLRequest(url: url)
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let postString = "SELECT * FROM tblObjectType"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data: Data?, response: URLResponse?, error: Error?) in
            print(data)
            //self.keepDoingStuff(with: data!)
        })
        task.resume()
        //eyy I'm out
    }
    
    func keepDoingStuff(with data: Data) {
        print(data)
    }
    
    
    @IBOutlet weak var locationTypeName: UITextField!
    @IBAction func getGPSLocation(_ sender: Any) {
        locationManager.requestLocation()
        print(locationTypeName.text)
        
    }
    
}
//extension ViewController: CLLocationManagerDelegate {
//
//}


