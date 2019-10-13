//
//  TableViewController.swift
//  42Events
//
//  Created by Ryan DE KWAADSTENIET on 2019/10/13.
//  Copyright © 2019 Rush00Team. All rights reserved.
//

import UIKit

private let reuseIdentifier = "EventCell"

struct CellData {
    let name: String?
    let desc: String?
    let date: String?
    let nSub: String?
    let mSub: String?
    let locn: String?
    let kind: String?
    let dura: String?
    let bTim: String?
    let eTim: String?
}

class EventTableViewController: UITableViewController {

    var client = Client()
    var conn = APIConnection()
    var dataToPass: EventData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Events are here! Use client.events.whateveryouwant")
        
        self.tableView.register(EventCell.self, forCellReuseIdentifier: "EventCell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 80
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return client.events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EventCell
        
        cell.sizeToFit()
        cell.name = client.events[indexPath.row].name
        cell.desc = client.events[indexPath.row].desc
        cell.date = client.events[indexPath.row].begin_at
        cell.layoutIfNeeded()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        dataToPass = client.events[indexPath.row]
        performSegue(withIdentifier: "passEventData", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passEventData" {
            let vc = segue.destination as! EventViewController
            vc.data = dataToPass
        }
    }

}
