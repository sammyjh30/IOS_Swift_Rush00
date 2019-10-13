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

    var data = [CellData]()
    var dataToPass: CellData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = [CellData(name: "Free CommServ", desc: "Come get ya CommServ, we know how much you love doing shit for us so come fufill your dreams.", date: "12-12-2012", nSub: "100", mSub: "120", locn: "Waterfront Campus", kind: "The Best Kind", dura: "8 hours", bTim: "12:12", eTim: "20:12")]
        
        self.tableView.register(EventCell.self, forCellReuseIdentifier: "EventCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EventCell
        
        cell.sizeToFit()
        cell.name = data[indexPath.row].name
        cell.desc = data[indexPath.row].desc
        cell.date = data[indexPath.row].date
        cell.layoutIfNeeded()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataToPass = data[0]

        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        performSegue(withIdentifier: "passEventData", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passEventData" {
            let vc = segue.destination as! EventViewController
            vc.data = dataToPass
        }
    }

}
