//
//  TableViewController.swift
//  City_Temperature
//

import UIKit

class TableViewController: UITableViewController {

    
    let city = ["Seattle", "Boston", "Miami", "Los Angeles", "Portland", "New York,"]
    let temp = ["6", "-4", "23", "11", "4", "-4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        
        cell.lblCity.text = city[indexPath.row]
        cell.lblTemp.text = temp[indexPath.row] + "℃"

        return cell
    }


   
}
