import UIKit

class QuestionViewController: UIViewController {
    //storyboard id = questId
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var var1Label: UIButton!
    @IBOutlet weak var var2Label: UIButton!
    @IBOutlet weak var var3Label: UIButton!
    @IBOutlet weak var var4Label: UIButton!
    
    var pageNum=0;
    var questions = [Question]()
    var numOfCorrectAnsw=0
    
    var delegateMain:MainViewControllerDelegate?
    var allBtns=[UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allBtns=[var1Label,var2Label,var3Label,var4Label]
        questions=getQuestions()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "images/quiz-bg.jpg")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        changeQues(pageNumber: pageNum)
        
        
    }
    
    @IBAction func goToPrevQuestion(_ sender: Any) {
        if pageNum==0{
            let vcMain = storyboard?.instantiateViewController(identifier: "mainId") as! MainViewController
            navigationController?.pushViewController(vcMain, animated: true)
            
        }else if pageNum==1{
            self.prevBtn.setTitle("go to Main", for: .normal)
            self.pageNum-=1
            changeQues(pageNumber: pageNum)
            
        }else{
            self.pageNum-=1
            changeQues(pageNumber: pageNum)
            self.prevBtn.setTitle("Prev", for: .normal)
        }
    }
    
    @IBAction func goToNextQuestion(_ sender: Any) {
        if pageNum==questions.count-1{
            //save result
            delegateMain?.addNewRes(numOfCorrectAnsw)
            print("send new res: \(numOfCorrectAnsw)")
            
            //go to result page
            let vcRes = storyboard?.instantiateViewController(identifier: "resSBId") as! ResultViewController
            
            vcRes.delegateQuestVC=self
            
            vcRes.res=numOfCorrectAnsw
            vcRes.questCount=questions.count
            
            navigationController?.pushViewController(vcRes, animated: true)
            
        }else if pageNum==questions.count-2{
            self.nextBtn.setTitle("Finish", for: .normal)
            self.pageNum+=1
            changeQues(pageNumber: pageNum)
            
        }else {
            self.pageNum+=1
            self.nextBtn.setTitle("Next", for: .normal)
            changeQues(pageNumber: pageNum)
            
        }
    }
    
    //variants btns tap
    @IBAction func var1Tap(_ sender: Any) {
        checkAnswer(question: questions[pageNum],
                    answ: questions[pageNum].answer[0],
                    btn: var1Label )
        enableBtns(enbleState: false)
        // var1Label.setTitle("you choose this", for: .highlighted)
    }
    @IBAction func var2Tap(_ sender: Any) {
        checkAnswer(question: questions[pageNum],
                    answ: questions[pageNum].answer[1],
                    btn: var2Label )
        enableBtns(enbleState: false)
    }
    @IBAction func var3Tap(_ sender: Any) {
        checkAnswer(question: questions[pageNum],
                    answ: questions[pageNum].answer[2],
                    btn: var3Label )
        enableBtns(enbleState: false)
    }
    
    @IBAction func var4Tap(_ sender: Any) {
        checkAnswer(question: questions[pageNum],
                    answ: questions[pageNum].answer[3],
                    btn: var4Label )
        enableBtns(enbleState: false)
    }
    
    //my functions
    func changeQues(pageNumber:Int){
        enableBtns(enbleState: true)
        colorBtns()
        
        questionLabel.text=questions[pageNumber].question
        
        var1Label.setTitle(questions[pageNumber].answer[0].text, for: .normal)
        var2Label.setTitle(questions[pageNumber].answer[1].text, for: .normal)
        var3Label.setTitle(questions[pageNumber].answer[2].text, for: .normal)
        var4Label.setTitle(questions[pageNumber].answer[3].text, for: .normal)
    }
    func enableBtns(enbleState:Bool){
        for (_, button) in allBtns.enumerated() {
            button.isEnabled=enbleState;
        }
    }
    func colorBtns(){
        for (_, button) in allBtns.enumerated() {
            button.backgroundColor=UIColor(red: 0.64,
                                           green: 0.66,
                                           blue: 0.88,
                                           alpha: 1.00)
            button.setTitleColor(UIColor.white,for:.normal)
        }
    }
    func checkAnswer(question:Question,answ:Answer,btn:UIButton)  {
        //change color
        btn.backgroundColor = UIColor.white
        btn.setTitleColor(UIColor.black,for:.normal)
        
        //check
        if question.answer.contains(where: {$0.text == answ.text}) && answ.correct==true{
            numOfCorrectAnsw+=1
        }
        print(numOfCorrectAnsw)
    }
    func getQuestions()->[Question]{
        var questions = [Question]()
        questions.append(Question( question: "you like ice cream?",
                                   answer: [Answer(text: "yes",
                                                   correct: true),
                                            Answer(text: "no",
                                                   correct: false),
                                            Answer(text: "smth",
                                                   correct: false),
                                            Answer(text: "smth",
                                                   correct: false)]
        ))
        questions.append(Question( question: "you like swift?",
                                   answer: [Answer(text: "yes",
                                                   correct: true),
                                            Answer(text: "no",
                                                   correct: false),
                                            Answer(text: "smth",
                                                   correct: false),
                                            Answer(text: "smth",
                                                   correct: false)]
        ))
        questions.append(Question( question: "Alpamys agay is?",
                                   answer: [Answer(text: "teacher",
                                                   correct: false),
                                            Answer(text: "ios monster",
                                                   correct: true),
                                            Answer(text: "acter",
                                                   correct: false),
                                            Answer(text: "student",
                                                   correct: false)]
        ))
        return questions
    }
}
