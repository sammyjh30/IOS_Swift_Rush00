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
        var curses: String = "" //TODO
        
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
        func getUserInfo(token: String,username: String,  completion: @escaping (_ firstName: String, _ lastName: String, _ login: String, _ photo:String) -> ()) {
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
                            //print("data: \(dataString)")
                            let jData = try? JSONSerialization.jsonObject(with: data, options: [])
                            if let jData = jData as? [String: Any] {
                                //print(jData)
                                //assign found data to variables
                                self.userFirstName = jData["first_name"] as? String ?? ""
                                self.userLastName = jData["last_name"] as? String ?? ""
                                self.userLogin = jData["login"] as? String ?? ""
                                self.userPhoto = jData["image_url"] as? String ?? ""
                                //TODO: Get curses and parse name & level
//                                print("User found with Firstname: \(self.userFirstName), Lastname: \(self.userLastName), Login: \(self.userLogin) Photo: \(self.userPhoto)")
                                completion(self.userFirstName, self.userLastName, self.userLogin, self.userPhoto)
                            }
                        }
                    }
                }
                task.resume()
            }
    }
