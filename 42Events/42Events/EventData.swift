//
//  EventData.swift
//  42Events
//
//  Created by abduraghmaan GABRIELS on 2019/10/13.
//  Copyright © 2019 Rush00Team. All rights reserved.
//

import Foundation

class EventData : NSObject{
//    "id": 3510,
    var id:Int?
//    "name": "Dimension Data Corporate Sponsor Day ",
    var name:String
//    "description": "An opportunity to meet Dimension Data and to find out more about the work they do.",
    var desc: String
//    "location": "Cluster 3",
    var location:String
//    "kind": "event",
    var kind:String
//    "max_people": null,
    var max_people:Int?
//    "nbr_subscribers": 47,
    var nbr_subs:Int?
//    "begin_at": "2019-10-28T07:00:00.000Z",
    var begin_at:Date
//    "end_at": "2019-10-28T10:00:00.000Z",
    var end_at:Date
    
//    "campus_ids": [
//        15
//    ],
    var campus_ids:[Int]
//    "cursus_ids": [
//        8
//    ],
    var cursus_ids:[Int]
//    "created_at": "2019-10-08T13:39:15.752Z",
    var created_at:Date
//    "updated_at": "2019-10-11T14:39:33.879Z",
    var updated_at:Date
//    "prohibition_of_cancellation": null,
    var prohib_cancel:String?
//    "waitlist": null,
    var waitlist:[String]?
//    "themes": []
    var themes:[String]
    
    init(event:[String:Any]){
        self.id = event["id"] as? Int
        self.name = event["name"] as! String
        self.desc = event["description"] as! String
        self.location = event["loacation"] as! String
        self.kind = event["kind"] as! String
        self.max_people = event["max_people"] as? Int
        self.nbr_subs = event["nbr_subs"] as? Int
        self.begin_at = event["begin_at"] as! Date
        self.end_at = event["end_at"] as! Date
        self.campus_ids = event["campus_ids"] as! [Int]
        self.cursus_ids = event["cursus_ids"] as! [Int]
        self.created_at = event["created_at"] as! Date
        self.updated_at = event["updated_at"] as! Date
        self.prohib_cancel = event["prohibition_of_cancellation"] as? String
        self.waitlist = event["waitlist"] as? [String]
        self.themes = event["themes"] as! [String]
    }
}
