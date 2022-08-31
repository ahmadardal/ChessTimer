//
//  ViewController.swift
//  TestKlocka
//
//  Created by Ahmad Ardal on 2022-08-28.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblCount1: UILabel!
    @IBOutlet weak var lblCount2: UILabel!
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    var firstPlay: Bool = true
    
    var count1: TimeInterval = 300.0
    var count2: TimeInterval = 300.0
    
    var player1Enabled: Bool = false
    var player2Enabled: Bool = false
    
    var lastPlayed: String?
    
    var timer: Timer?
    
    var timeFormatter: DateComponentsFormatter = DateComponentsFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timeFormatter.allowedUnits = [.minute, .second]
        
        let timeLeft1 = timeFormatter.string(from: count1)
        
        lblCount1.text = timeLeft1
        
        let timeLeft2 = timeFormatter.string(from: count2)
        
        lblCount2.text = timeLeft2
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onPlay(_ sender: Any) {
        
        if firstPlay == true {
            btnPlay.setTitle("Switch", for: .normal)
            firstPlay = false
            
            print("FIRST PLAY")
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: tick1(timer:))
            player1Enabled = true
            lastPlayed = "Player1"
            return
        }
        
        if let lstPlayed = lastPlayed {
            
            if lstPlayed == "Player1" {
                timer?.invalidate()
                player1Enabled = false
                
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: tick2(timer:))
                lastPlayed = "Player2"
                player2Enabled = true
            } else if lstPlayed == "Player2" {
                timer?.invalidate()
                player2Enabled = false
                
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: tick1(timer:))
                lastPlayed = "Player1"
                player1Enabled = true
                
            }
        }
        
        

        
    }
    
    
    func reset() {
        timer?.invalidate()
        lastPlayed = nil
        player1Enabled = false
        player2Enabled = false
        
        firstPlay = true
        
        count1 = 300.0
        count2 = 300.0
        
        let timeLeft1 = timeFormatter.string(from: count1)
        let timeLeft2 = timeFormatter.string(from: count2)
        
        lblCount1.text = timeLeft1
        lblCount2.text = timeLeft2
        btnPlay.setTitle("Play", for: .normal)
    }
    
    @IBAction func onReset(_ sender: Any) {
        
        reset()
        
    }
    
    func tick1(timer: Timer) {
        count1 -= 1
        
        let timeLeft = timeFormatter.string(from: count1)
        lblCount1.text = timeLeft
        
    }
    
    func tick2(timer: Timer) {
        
        count2 -= 1
        
        let timeLeft = timeFormatter.string(from: count2)
        lblCount2.text = timeLeft
        
        
    }
    
    
}











//@IBOutlet weak var lblPlayer1: UILabel!
//@IBOutlet weak var lblPlayer2: UILabel!
//
//
//@IBOutlet weak var btnStart: UIButton!
//@IBOutlet weak var btnReset: UIButton!
//
//let timeFormatter = DateComponentsFormatter()
//
//
//var firstPlay = true
//
//var count1: Double = 300.0
//var count2: Double = 300.0
//
//var player1Enabled: Bool = false
//var player2Enabled: Bool = false
//
//var myTimer: Timer?
//
//var lastPlayed: String?
//
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    // Do any additional setup after loading the view.
//
//    timeFormatter.allowedUnits = [.hour, .minute, .second]
//
//    let timeLeft1 = timeFormatter.string(from: TimeInterval(count1))
//    lblPlayer1.text = timeLeft1
//
//    let timeLeft2 = timeFormatter.string(from: TimeInterval(count2))
//    lblPlayer2.text = timeLeft2
//
//}
//
//
//@IBAction func onStart(_ sender: Any) {
//
//    if firstPlay {
//        firstPlay = false
//        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: tick1(timer:))
//        player1Enabled = true
//        btnStart.setTitle("Switch", for: .normal)
//        lastPlayed = "Player1"
//        return
//    }
//
//    if let lstPlayed = lastPlayed {
//        if lstPlayed == "Player1" {
//            myTimer?.invalidate()
//            player1Enabled = false
//
//            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: tick2(timer:))
//            lastPlayed = "Player2"
//            player2Enabled = true
//        } else if lstPlayed == "Player2" {
//            myTimer?.invalidate()
//            player2Enabled = false
//
//            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: tick1(timer:))
//            lastPlayed = "Player1"
//            player1Enabled = true
//        }
//    }
//
//}
//
//func tick1(timer: Timer) {
//
//    count1 -= 1
//    let timeLeft = timeFormatter.string(from: TimeInterval(count1))
//    lblPlayer1.text = timeLeft
//
//}
//
//func tick2(timer: Timer) {
//
//    count2 -= 1
//    let timeLeft = timeFormatter.string(from: TimeInterval(count2))
//    lblPlayer2.text = timeLeft
//
//}
//
//
//
//@IBAction func onReset(_ sender: Any) {
//    myTimer?.invalidate()
//    firstPlay = true
//    lastPlayed = nil
//    player1Enabled = false
//    player2Enabled = false
//
//    count1 = 300.0
//    count2 = 300.0
//
//    let timeLeft1 = timeFormatter.string(from: TimeInterval(count1))
//    let timeLeft2 = timeFormatter.string(from: TimeInterval(count2))
//
//    lblPlayer1.text = timeLeft1
//    lblPlayer2.text = timeLeft2
//
//    btnStart.setTitle("Play", for: .normal)
//
//}
