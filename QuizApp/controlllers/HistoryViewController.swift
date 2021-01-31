import UIKit

class HistoryViewController: UIViewController{
    //storyboard id = histId
    
    @IBOutlet weak var tableView: UITableView!
    var results = [Int]()
    let cellId="cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource = self
      
        
        
        
        let otherVC = MainViewController()
                results = otherVC.results
                print("there is results: \(results)") 
        
        tableView.reloadData()
        print("table was reload")
        
        tableView.register(UINib(nibName: "HistoryViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
    }
   
}

extension HistoryViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for: indexPath) as! HistoryViewCell
        
        cell.delegate = self
         
        cell.id=indexPath.row
        cell.resIdLabel.text="Res: \(indexPath.row + 1)"
        cell.resLabel.text="\(results[indexPath.row])/3"
        
        return cell
    }
}
