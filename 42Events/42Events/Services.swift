//
//  Services.swift
//  42Events
//
//  Created by Harmun Rossouw on 2019/10/12.
//  Copyright © 2019 Rush00Team. All rights reserved.
//

import Foundation
import UIKit

enum clientStuff : String {
    //your application's intra id & secret key
    case client_id = "723fed767a337f28015b7b0c14aa2040ee9aa4503561fff7d188c124b9d9817c"
    case client_secret = "2a27cdd1948dabbe45607def1b684d0230e120bea1c854ba0078e2c87cc9af4c"
}

class Client {
    //variables
    var token : String = ""
    var userFirstName : String = ""
    var userLastName: String = ""
    var userLogin: String = ""
    var userPhoto: String = ""
    var userLevel: Double = 0
    //var curses: String = ""
    var cursusNames: [String] = []
    var cursusLevels: [Double] = []
    
    //event
    var events: [String] = []
    
    //POST generates the auth02 token, returns token as string
    func genTok(completion: @escaping (_ token: String) -> ()) {
        //setup URL and headers
        let url = URL(string: "https://api.intra.42.fr/oauth/token?client_id=\(clientStuff.client_id.rawValue)&client_secret=\(clientStuff.client_secret.rawValue)&grant_type=client_credentials")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        //make request task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    //print("data: \(dataString)")
                    let jData = try? JSONSerialization.jsonObject(with: data, options: [])
                    if let jData = jData as? [String: Any] {
                        //print(jData)
                        self.token = jData["access_token"] as! String
                        //                                print("Self: \(self.token)")
                        completion(self.token)
                    }
                }
            }
        }
        task.resume()
        print("Task resumed, getting Token")
    }
    
    //GET gets user info (firstName, lastName, login, photo) and returns as string
    func getUserInfo(token: String,username: String,  completion: @escaping (_ firstName: String, _ lastName: String, _ login: String, _ photo:String, _ userLevel:Double, _ cursusName:[String], _ cursusLevel:[Double]) -> ()) {
        //setup URL and headers
        let url = URL(string:"https://api.intra.42.fr/v2/users/\(username)/")!
        let headers = [ "Authorization": "Bearer \(token)"]
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        //make request task
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    do {
                        let jData = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        let cursesList: [NSDictionary] = (jData["cursus_users"] as? [NSDictionary])!
                        self.userFirstName = jData["first_name"] as? String ?? ""
                        self.userLastName = jData["last_name"] as? String ?? ""
                        self.userLogin = jData["login"] as? String ?? ""
                        self.userPhoto = jData["image_url"] as? String ?? ""
                        
                        for elem in cursesList {
                            //let name = elem["cursus_users"] as! NSDictionary
                            //print(name)
                            self.userLevel = elem["level"] as? Double ?? 0
                            let skillsList: [NSDictionary] = (elem["skills"] as? [NSDictionary])!
                            for elem in skillsList{
                                let skillName = elem["name"]
                                let skillLevel = elem["level"]
                                self.cursusNames.append(skillName as? String ?? "")
                                self.cursusLevels.append(skillLevel as? Double ?? 0)
                            }
                            
                        }
                        //                        print(self.cursusNames, self.cursusLevels)
                        completion(self.userFirstName, self.userLastName, self.userLogin, self.userPhoto,self.userLevel, self.cursusNames, self.cursusLevels)
                    } catch let er {
                        print(er)
                    }
                }
            }
        }
        task.resume()
    }
    
    //GET JSON events object
    func getEventsInfo(token: String, completion: @escaping (_ events: [String]) -> ()) {
        //setup URL and headers
        let url = URL(string:"https://api.intra.42.fr/v2/events?&filter[future]=true")!
        let headers = [ "Authorization": "Bearer \(token)"]
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        //make request task
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    do {
                        let jData = try JSONSerialization.jsonObject(with: data, options: []) as! [NSDictionary]
                        print(jData)
                        completion(self.events)
                    }
                        //                        print(self.cursusNames, self.cursusLevels)
                    catch let er {
                        print(er)
                    }
                }
            }
        }
        task.resume()
    }
    
}
