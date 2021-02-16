//
//  ViewController.swift
//  assignment2
//



import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var lblWinLoose: UILabel!
    
    @IBOutlet weak var lblBalance: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    
    
    let writeDiceArray = ["WhiteDice1","WhiteDice2", "WhiteDice3", "WhiteDice4",  "WhiteDice5", "WhiteDice6"]
    
    let redDiceArray = ["RedDice1","RedDice2", "RedDice3", "RedDice4",  "RedDice5", "RedDice6"]
    
    var rand1 = Int.random(in: 1...6)
    var rand2 = Int.random(in: 1...6)
    
    var balance = 20
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeImages()
        lblWinLoose.text = "Please tap Play button"
        lblBalance.text = "Your balance = \(balance)$"
    }
    
    func changeImages() {
        rand1 = Int.random(in: 1...6)
        rand2 = Int.random(in: 1...6)
        image1.image = UIImage(named: writeDiceArray[rand1-1])
        image2.image = UIImage(named: redDiceArray[rand2-1])

    }
    
    
    
    @IBAction func playSlotMachine(_ sender: UIButton) {
        changeImages()
        
        let sum = rand1 + rand2
        
        if sum == 7 {
            balance = balance + 3
            lblWinLoose.text = "You won 3$"

        }
        else if sum > 7 {
            balance += 1
            lblWinLoose.text = "You won 1$"

        }else{
            balance -= 1
            lblWinLoose.text = "You lost 1$"

        }
        
        lblBalance.text = "Your balance = \(balance)$"
        
        if balance <= 0 {
            playBtn.isEnabled = false
            lblWinLoose.text = "Please restart app"
        }

    }
    

}

