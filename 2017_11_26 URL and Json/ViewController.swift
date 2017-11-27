//
//  ViewController.swift
//  2017_11_26 URL and Json
//
//  Created by C4Q on 11/26/17.
//  Copyright © 2017 Quark. All rights reserved.
// a projecet by https://www.youtube.com/watch?v=YY3bTxgxWss&t=106s

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        // APIs used https://api.letsbuildthatapp.com/jsondecodable/website_description, https://api.letsbuildthatapp.com/jsondecodable/courses, https://api.letsbuildthatapp.com/jsondecodable/course
        let JSONURLString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        // we need a url in order to work with the url sesion
        guard let myURL = URL(string: JSONURLString) else{return}
        // we need to execute some kind of a URL Sesion to fetch the data from the internet
        URLSession.shared.dataTask(with: myURL) { (data, response, err) in
            // you need to check err
            //you need to check response status 200 ok!!
            
            
            // you need to check if you can have data or not?
            guard let data = data else{return}
            //this method is used to convert data to a sting
            //            let dataToStrin = String(data: data, encoding: .utf8)
            
            
            do{
                // Another example for decodable:
                let myDecoder = JSONDecoder()
                let myWebSiteDescribtion = try myDecoder.decode(WebSiteDescribtion.self, from: data)
                for course in myWebSiteDescribtion.courses{
                    print(course.name)
                }
                
                // Mark Codable Method:
                /*
                 let myDecoder = JSONDecoder()
                 let mycourses = try myDecoder.decode([Course].self, from: data)
                 for course in mycourses{
                 print(course.name)
                 
                 */
            
            //Mark DownCasting method for only one course:
            /*
             guard let myJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {return}
             let course = Course(from: myJSON)
             print(course.name)
             */
        }
        catch let error{
            print(error)
        }
        
    }.resume() // then you need to resume the URLsesions to make sure you fire it on
    super.viewDidLoad()
    
}

}

