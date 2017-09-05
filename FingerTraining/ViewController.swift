//
//  ViewController.swift
//  FingerTraining
//
//  Created by 罗文宇 on 2017/9/4.
//  Copyright © 2017年 罗文宇. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var planView: UIImageView!
    @IBOutlet weak var detailView: UIImageView!
    @IBOutlet weak var detailPreview: UIImageView!
    @IBOutlet weak var detailViewText: UILabel!
    @IBOutlet weak var detailPreviewText: UILabel!
    @IBOutlet weak var tipsViewText: UILabel!
    
    let SECONDS = 604
    
    var seconds = 0
    var showSeconds = 0
    
    var timer = Timer()
    
    var isTimerRuning = false
    var paused = false
    
    let beginSoundID: SystemSoundID = 1005
    let restSoundID: SystemSoundID = 1021
    
    let mainColor = UIColor(red: 100/255, green: 103/255, blue: 108/255, alpha: 1)
    let runningColor = UIColor(red: 84/255, green: 108/255, blue: 81/255, alpha: 1)
    let pauseColor = UIColor(red: 34/255, green: 97/255, blue: 108/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        seconds = SECONDS
        DispatchQueue.main.async {
            self.view.backgroundColor = self.mainColor
            self.pauseButton.isEnabled = false
            self.pauseButton.setTitleColor(.gray, for: .normal)
            self.detailView.isHidden = true
            self.detailPreview.isHidden = true
            self.detailViewText.isHidden = true
            self.detailPreviewText.isHidden = true
            self.tipsViewText.isHidden = true
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let seconds = Int(time) % 60
        
        return String(format:"%02i", seconds)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTime)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        DispatchQueue.main.async {
            self.timerLabel.text = self.timeString(time: TimeInterval(self.showSeconds))
        }
    }
    
    func StopTimer() {
        timer.invalidate()
        DispatchQueue.main.async {
            self.view.backgroundColor = self.mainColor
            self.isTimerRuning = false
            self.startButton.isEnabled = true
            self.startButton.setTitleColor(.white, for: .normal)
            self.pauseButton.isEnabled = false
            self.pauseButton.setTitleColor(.gray, for: .normal)
            self.pauseButton.setTitle("PAUSE", for: .normal)
            self.paused = false
            self.planView.isHidden = false
            self.detailView.isHidden = true
            self.detailPreview.isHidden = true
            self.detailViewText.isHidden = true
            self.detailPreviewText.isHidden = true
            self.detailView.image = UIImage(named: "初级计划1.png")
            self.detailPreview.image = UIImage(named: "初级计划2.png")
            self.tipsViewText.isHidden = true
            self.tipsViewText.text = "准备"
        }
        seconds = SECONDS
        showSeconds = 0
        updateTimer()
    }
    
    @objc func updateTime() {
        // 0
        if seconds == 604 {
            tipsViewText.text = "3"
            showSeconds = 4
        }
        if seconds == 603 {
            tipsViewText.text = "2"
        }
        if seconds == 602 {
            tipsViewText.text = "1"
        }
        if seconds == 601 {
            tipsViewText.text = "开始"
        }
        // 1
        if seconds == 600 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "悬吊"
            showSeconds = 16
        }
        if seconds == 585 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 46
        }
        // 2
        if seconds == 540 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "引体"
            detailView.image = UIImage(named: "初级计划2.png")
            detailPreview.image = UIImage(named: "初级计划3.png")
            showSeconds = 11
        }
        if seconds == 530 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 51
        }
        // 3
        if seconds == 480 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划3.png")
            detailPreview.image = UIImage(named: "初级计划4.png")
            showSeconds = 11
        }
        if seconds == 470 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 51
        }
        // 4
        if seconds == 420 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划4.png")
            detailPreview.image = UIImage(named: "初级计划5.png")
            showSeconds = 16
        }
        if seconds == 405 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "耸肩"
            showSeconds = 16
        }
        if seconds == 390 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 31
        }
        // 5
        if seconds == 360 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划5.png")
            detailPreview.image = UIImage(named: "初级计划6.png")
            showSeconds = 21
        }
        if seconds == 340 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "引体"
            showSeconds = 11
        }
        if seconds == 330 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 31
        }
        // 6
        if seconds == 300 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划6.png")
            detailPreview.image = UIImage(named: "初级计划7.png")
            showSeconds = 11
        }
        if seconds == 290 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "举膝"
            showSeconds = 21
        }
        if seconds == 270 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 31
        }
        // 7
        if seconds == 240 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "引体"
            detailView.image = UIImage(named: "初级计划7.png")
            detailPreview.image = UIImage(named: "初级计划8.png")
            showSeconds = 21
        }
        if seconds == 220 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 41
        }
        // 8
        if seconds == 180 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划8.png")
            detailPreview.image = UIImage(named: "初级计划9.png")
            showSeconds = 11
        }
        if seconds == 170 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 51
        }
        // 9
        if seconds == 120 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "引体"
            detailView.image = UIImage(named: "初级计划9.png")
            detailPreview.image = UIImage(named: "初级计划10.png")
            showSeconds = 21
        }
        if seconds == 100 {
            AudioServicesPlayAlertSound(restSoundID)
            tipsViewText.text = "休息"
            showSeconds = 41
        }
        // 10
        if seconds == 60 {
            AudioServicesPlayAlertSound(beginSoundID)
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划10.png")
            detailPreview.isHidden = true
            detailPreviewText.isHidden = true
            showSeconds = 61
        }
        
        if seconds < 1 {
            AudioServicesPlayAlertSound(restSoundID)
            StopTimer()
        } else {
            seconds -= 1
            showSeconds -= 1
            updateTimer()
        }
    }

    @IBAction func onStartButtonClick(_ sender: UIButton) {
        if !isTimerRuning {
            runTimer()
            DispatchQueue.main.async {
                self.view.backgroundColor = self.runningColor
                self.isTimerRuning = true
                self.startButton.isEnabled = false
                self.startButton.setTitleColor(.gray, for: .normal)
                self.pauseButton.isEnabled = true
                self.pauseButton.setTitleColor(.white, for: .normal)
                self.planView.isHidden = true
                self.detailView.isHidden = false
                self.detailPreview.isHidden = false
                self.detailViewText.isHidden = false
                self.detailPreviewText.isHidden = false
                self.tipsViewText.isHidden = false
            }
        }
    }
    
    @IBAction func onPauseButtonClick(_ sender: UIButton) {
        if !paused {
            AudioServicesPlayAlertSound(restSoundID)
            DispatchQueue.main.async {
                self.view.backgroundColor = self.pauseColor
                self.timer.invalidate()
                self.pauseButton.setTitle("RESUME", for: .normal)
                self.paused = true
            }
        } else {
            AudioServicesPlayAlertSound(beginSoundID)
            runTimer()
            DispatchQueue.main.async {
                self.view.backgroundColor = self.runningColor
                self.pauseButton.setTitle("PAUSE", for: .normal)
                self.paused = false
            }
        }
    }
    
    @IBAction func onResetButtonClick(_ sender: UIButton) {
        StopTimer()
    }
}

