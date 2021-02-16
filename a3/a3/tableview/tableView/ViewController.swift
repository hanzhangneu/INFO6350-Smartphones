//
//  ViewController.swift
//  tableView


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbView: UITableView!
    
    let names = [    "George Washington",
                     "John Adams",
                     "Thomas Jefferson",
                     "James Madison",
                     "James Monroe",
                     "John Quincy Adams",
                     "Andrew Jackson",
                     "Martin van Buren",
                     "William Henry Harrison",
                     "John Tyler",
                     "James Polk",
                     "Zachary Taylor",
                     "Millard Fillmore",
                     "Franklin Pierce",
                     "James Buchanan",
                     "Abraham Lincoln",
                     "Andrew Johnson",
                     "Ulysses S. Grant",
                     "Rutherford B. Hayes",
                     "James Abram Garfield",
                     "Chester Alan Arthur",
                     "Grover Cleveland",
                     "Benjamin Harrison",
                     "Grover Cleveland",
                     "William McKinley",
                     "Theodore Roosevelt",
                     "William Howard Taft",
                     "Woodrow (Thomas) Wilson",
                     "Warren Gamaliel Harding",
                     "Calvin (John) Coolidge",
                     "Herbert Clark Hoover",
                     "Franklin Delano Roosevelt",
                     "Harry S. Truman",
                     "Dwight (David) Eisenhower",
                     "John Fitzgerald Kennedy",
                     "Lyndon Baines Johnson",
                     "Richard Milhouse Nixon",
                     "Gerald Rudolph Ford",
                     "Jimmy Carter",
                     "Ronald Wilson Reagan",
                     "George Herbert Walker Bush",
                     "William (Bill) Jefferson Clinton",
                     "George Walker Bush",
                     "Barack Hussein Obama",
                     "Donald Trump",
                     "Joseph Robinette Biden Jr"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
    }
    
    
}

