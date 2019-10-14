//
//  TableViewController.swift
//  42Events
//
//  Created by Ryan DE KWAADSTENIET on 2019/10/13.
//  Copyright © 2019 Rush00Team. All rights reserved.
//

import UIKit

private let reuseIdentifier = "EventCell"

class EventTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchyBar: UISearchBar!
    
    var client = Client()
    var filteredData: [EventData] = []
    var conn = APIConnection()
    var dataToPass: EventData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(EventCell.self, forCellReuseIdentifier: "EventCell")
        searchyBar.delegate = self
        filteredData = client.events
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 80
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EventCell
        
        cell.sizeToFit()
        cell.name = filteredData[indexPath.row].name
        cell.desc = filteredData[indexPath.row].desc
        cell.date = filteredData[indexPath.row].begin_at
        cell.layoutIfNeeded()
        cell.layer.backgroundColor = UIColor.clear.cgColor

        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.gray.cgColor

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        dataToPass = filteredData[indexPath.row]
        performSegue(withIdentifier: "passEventData", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passEventData" {
            let vc = segue.destination as! EventViewController
            vc.data = dataToPass
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = (searchText.isEmpty) ? client.events : (searchText.contains("Kind: ")) ? client.events.filter{$0.kind.range(of: searchText.components(separatedBy: "Kind: ")[1], options: .caseInsensitive) != nil} : (searchText.contains("Campus: ")) ? client.events.filter{String($0.campus_ids[0]).range(of: searchText.components(separatedBy: "Campus: ")[1], options: .caseInsensitive) != nil} : (searchText.contains("Cursus: ")) ? client.events.filter{String($0.cursus_ids[0]).range(of: searchText.components(separatedBy: "Cursus: ")[1], options: .caseInsensitive) != nil} : client.events

        self.tableView.reloadData()
    }

    func formatDate(date: String) -> String{
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        return format.string(from: format.date(from: date) ?? Date())
    }
}
