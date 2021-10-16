//
//  ViewController.swift
//  HashGame
//
//  Created by apple on 26/07/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet var buttons: [UIButton]!
    
    
    //MARK:- Define Variable
    var board = [String]()
    var currentPlayer = ""
    let rule = [[0,1,2],[3,4,5],
                [6,7,8],[0,3,6],
                [1,4,7],[2,5,8],
                [0,4,8],[2,4,6]]
    
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBoard()
        print(board)
        // Do any additional setup after loading the view.
    }

    
    /*** Set Button to Zero and X ***/
    //UIButton Tapped
    @IBAction func buttonPressend(_ sender: Any) {
        let index = buttons.firstIndex(of: sender as! UIButton)!
        print(index)
        
        if !board[index].isEmpty {
            return
        }
        
        if currentPlayer == "X"{
            (sender as AnyObject).setTitle("X", for: .normal)
            currentPlayer = "0"
            board[index] = "X"
        }
        else{
            (sender as AnyObject).setTitle("0", for: .normal)
            currentPlayer = "X"
            board[index] = "0"
        }
        whoWins()
    }
    

    
    //MARK:- Check Function Who Wins
    func whoWins(){
        for rule in rule {
            let player0 = board[rule[0]]
            let player1 = board[rule[1]]
            let player2 = board[rule[2]]
            
            if player0 == player1,
               player1 == player2,
               !player0.isEmpty{
                showAlert("Sucess", "Winner is \(player0)")
                print("Winner is \(player0)")
            }
        }
        
        
        /*** this check to when all box are fill and no one win ***/
        if !board.contains(""){
            showAlert("Oops", "It's a tie")
        }
    }
    
    
    //MARK:- Show Alert
    func showAlert(_ title : String,_ msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.resetHash()
        }))
        self.present(alert, animated: true)
        
    }
    
    
    //MARK:- Board Load
    func loadBoard(){
        for _ in 0..<buttons.count {
            board.append("")
        }
    }

    
    //MARK:- Reset Board button
    @IBAction func resetButton(_ sender: Any) {
        resetHash()
    }
    
    
    /*** Reset Board Button Tapped ***/
    func resetHash(){
        board.removeAll()
        loadBoard()
       
        for button in buttons{
            button.setTitle("Here", for: .normal)
        }
    }
    
}
