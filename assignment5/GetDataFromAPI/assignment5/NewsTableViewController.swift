//
//  NewsTableViewController.swift

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class NewsTableViewController: UITableViewController {

    @IBOutlet var tblNews: UITableView!
    
    var newsArr: [News] = [News]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
   
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArr.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("NewsTableViewCell", owner: self, options: nil)?.first as! NewsTableViewCell
        
        cell.lblTitle.text = newsArr[indexPath.row].title
        
        return cell
    }
    
    func getUrl() -> String{
        var url = apiURL
        url.append("apiKey=")
        url.append(apiKey)
        
        return url
    }
    
    func getData(){
        let url = getUrl()
        
        AF.request(url).responseJSON{ response in
            
            if response.error == nil{
                
                guard let data = response.data else{return}
                
                guard let news = JSON(data)["articles"].array else{return}
                
                if news.count == 0 {return}
                
                self.newsArr = [News]()
                
                for new in news{
                    
                    let author = new["author"].stringValue
                    let title = new["title"].stringValue
                    let description = new["description"].stringValue
                    
                    self.newsArr.append(News(author: author, title: title, description: description))
                }
                self.tblNews.reloadData()
            }
        }
    }
}
