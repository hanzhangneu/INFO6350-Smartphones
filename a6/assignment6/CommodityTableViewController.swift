//
//  CommodityTableViewController.swift

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit

class CommodityTableViewController: UITableViewController {

    @IBOutlet var tblCommodity: UITableView!
    
    var commodityArr: [Commodity] = [Commodity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commodityArr.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CommodityTableViewCell", owner: self, options: nil)?.first as! CommodityTableViewCell
        
        cell.lblName.text = commodityArr[indexPath.row].name
        cell.lblPrice.text = "$ \(commodityArr[indexPath.row].price)"
        
        return cell
    }
  
    func getUrl() -> String{
        var url = apiURL
        url.append("apikey=")
        url.append(apikey)
        return url
    }
    
    func getData(){
        let url = getUrl()
        
        getDataFromAPI(url)
            .done{ (commoditys) in
                self.commodityArr = [Commodity]()
                for commodity in commoditys{
                    self.commodityArr.append(commodity)
                }
                self.tblCommodity.reloadData()
            }
            .catch{ (error) in
                print("Error in getting all the Commodity Info \(error)")
            }
    }
    
    func getDataFromAPI(_ url : String) -> Promise<[Commodity]>{
        
        return Promise<[Commodity]> { seal -> Void in
   
            AF.request(url).responseJSON{ response in
                
                if response.error == nil{
                    
                    var arr = [Commodity]()
                    
                    guard let data = response.data else{return seal.fulfill( arr )}
                    
                    guard let commoditys = JSON(data).array else{return seal.fulfill( arr )}
                    
                    for commodity in commoditys{
                        let name = commodity["name"].stringValue
                        let price = commodity["price"].floatValue
                        arr.append(Commodity(name: name, price: price))
                    }
                    seal.fulfill(arr)
                }else{
                    seal.reject(response.error!)
                }
            }
        }
    }
}
