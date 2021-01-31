import UIKit

class ResultViewController: UIViewController {
    //storyboard id = resSBId
    
    @IBOutlet weak var numReslabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var res=0
    var questCount=0
    var delegateQuestVC: QuestionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numReslabel.text="\(res)/\(questCount)"
        resultLabel.text=resultLabelCalc()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "images/res-bg.jpg")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        let vcQuest = storyboard?.instantiateViewController(identifier: "questId") as! QuestionViewController
        navigationController?.pushViewController(vcQuest, animated: true)
    }
    
    @IBAction func goToHomePage(_ sender: Any) {
        let vcMain = storyboard?.instantiateViewController(identifier: "mainId") as! MainViewController
        navigationController?.pushViewController(vcMain, animated: true)
    }
    
    //my func
    func resultLabelCalc() -> String {
        if(res==questCount){
            return "Exselent!"
        }else if(res>=2*questCount/3){
            return "Great!"
        }else if(res>=questCount/3){
            return "Not Bad"
        }
        else{
            return "Next Time Kid"
        }
    }
}
