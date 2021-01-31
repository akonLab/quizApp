import UIKit

class MainViewController: UIViewController {
//storyboard id = mainId
    var delegateQues:QuestionViewController?
    var results = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "images/main-bg.jpg")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        someHist()
        print("there is results: \(results)") 
        
    }
    
    @IBAction func startQuiz(_ sender: Any) {
        let vcQuiz = storyboard?.instantiateViewController(identifier: "questId") as! QuestionViewController
        vcQuiz.delegateMain=self
        navigationController?.pushViewController(vcQuiz, animated: true)
    }
    
    @IBAction func showHistory(_ sender: Any) {
        let vcHistory = storyboard?.instantiateViewController(identifier: "histId") as! HistoryViewController
        //vcHistory.delegateMain=self
        vcHistory.results=results
       navigationController?.pushViewController(vcHistory, animated: true)
    }
    func someHist() {
        results.append(1)
        results.append(3)
    }

}
protocol MainViewControllerDelegate {
    func addNewRes(_ res:Int)
}

extension MainViewController: MainViewControllerDelegate{
    func addNewRes(_ res: Int) {
        results.append(res)
        print("add res: \(res)")
       // tableView.reloadData()
    }
}
