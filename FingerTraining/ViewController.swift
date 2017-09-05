//
//  ViewController.swift
//  FingerTraining
//
//  Created by 罗文宇 on 2017/9/4.
//  Copyright © 2017年 罗文宇. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    var beginAudioPlayer = AVAudioPlayer()
    var restAudioPlayer = AVAudioPlayer()
    var endAudioPlayer = AVAudioPlayer()
    var countAudioPlayer = AVAudioPlayer()
    var resetAudioPlayer = AVAudioPlayer()
    let beginFileURL = URL(fileURLWithPath: "/System/Library/Audio/UISounds/Modern/sms_alert_keys.caf")
    let restFileURL = URL(fileURLWithPath: "/System/Library/Audio/UISounds/Modern/sms_alert_circles.caf")
    let endFileURL = URL(fileURLWithPath: "/Library/Ringtones/By The Seaside.m4r")
    let countFileURL = URL(fileURLWithPath: "/System/Library/Audio/UISounds/SIMToolkitPositiveACK.caf")
    let resetFileURL = URL(fileURLWithPath: "/System/Library/Audio/UISounds/Modern/sms_alert_input.caf")
    
    let mainColor = UIColor(red: 100/255, green: 103/255, blue: 108/255, alpha: 1)
    let runningColor = UIColor(red: 45/255, green: 104/255, blue: 121/255, alpha: 1)
    let pauseColor = UIColor(red: 51/255, green: 115/255, blue: 94/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        // initiate audio player
        do {
            beginAudioPlayer = try AVAudioPlayer(contentsOf: beginFileURL)
            restAudioPlayer = try AVAudioPlayer(contentsOf: restFileURL)
            endAudioPlayer = try AVAudioPlayer(contentsOf: endFileURL)
            countAudioPlayer = try AVAudioPlayer(contentsOf: countFileURL)
            resetAudioPlayer = try AVAudioPlayer(contentsOf: resetFileURL)
        } catch {
            debugPrint("\(error)")
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
            countAudioPlayer.play()
            tipsViewText.text = "3"
            showSeconds = 4
        }
        if seconds == 603 {
            countAudioPlayer.play()
            tipsViewText.text = "2"
        }
        if seconds == 602 {
            countAudioPlayer.play()
            tipsViewText.text = "1"
        }
        if seconds == 601 {
            beginAudioPlayer.play()
            tipsViewText.text = "开始"
        }
        // 1
        if seconds == 600 {
            tipsViewText.text = "悬吊"
            showSeconds = 16
        }
        if seconds == 585 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 46
        }
        // 2
        if seconds == 540 {
            beginAudioPlayer.play()
            tipsViewText.text = "引体"
            detailView.image = UIImage(named: "初级计划2.png")
            detailPreview.image = UIImage(named: "初级计划3.png")
            showSeconds = 11
        }
        if seconds == 530 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 51
        }
        // 3
        if seconds == 480 {
            beginAudioPlayer.play()
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划3.png")
            detailPreview.image = UIImage(named: "初级计划4.png")
            showSeconds = 11
        }
        if seconds == 470 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 51
        }
        // 4
        if seconds == 420 {
            beginAudioPlayer.play()
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划4.png")
            detailPreview.image = UIImage(named: "初级计划5.png")
            showSeconds = 16
        }
        if seconds == 405 {
            beginAudioPlayer.play()
            tipsViewText.text = "耸肩"
            showSeconds = 16
        }
        if seconds == 390 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 31
        }
        // 5
        if seconds == 360 {
            beginAudioPlayer.play()
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划5.png")
            detailPreview.image = UIImage(named: "初级计划6.png")
            showSeconds = 21
        }
        if seconds == 340 {
            beginAudioPlayer.play()
            tipsViewText.text = "引体"
            showSeconds = 11
        }
        if seconds == 330 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 31
        }
        // 6
        if seconds == 300 {
            beginAudioPlayer.play()
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划6.png")
            detailPreview.image = UIImage(named: "初级计划7.png")
            showSeconds = 11
        }
        if seconds == 290 {
            beginAudioPlayer.play()
            tipsViewText.text = "举膝"
            showSeconds = 21
        }
        if seconds == 270 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 31
        }
        // 7
        if seconds == 240 {
            beginAudioPlayer.play()
            tipsViewText.text = "引体"
            detailView.image = UIImage(named: "初级计划7.png")
            detailPreview.image = UIImage(named: "初级计划8.png")
            showSeconds = 21
        }
        if seconds == 220 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 41
        }
        // 8
        if seconds == 180 {
            beginAudioPlayer.play()
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划8.png")
            detailPreview.image = UIImage(named: "初级计划9.png")
            showSeconds = 11
        }
        if seconds == 170 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 51
        }
        // 9
        if seconds == 120 {
            beginAudioPlayer.play()
            tipsViewText.text = "引体"
            detailView.image = UIImage(named: "初级计划9.png")
            detailPreview.image = UIImage(named: "初级计划10.png")
            showSeconds = 21
        }
        if seconds == 100 {
            restAudioPlayer.play()
            tipsViewText.text = "休息"
            showSeconds = 41
        }
        // 10
        if seconds == 60 {
            beginAudioPlayer.play()
            tipsViewText.text = "悬吊"
            detailView.image = UIImage(named: "初级计划10.png")
            detailPreview.isHidden = true
            detailPreviewText.isHidden = true
            showSeconds = 61
        }
        
        if seconds < 1 {
            endAudioPlayer.play()
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
            restAudioPlayer.play()
            DispatchQueue.main.async {
                self.view.backgroundColor = self.pauseColor
                self.timer.invalidate()
                self.pauseButton.setTitle("RESUME", for: .normal)
                self.paused = true
            }
        } else {
            beginAudioPlayer.play()
            runTimer()
            DispatchQueue.main.async {
                self.view.backgroundColor = self.runningColor
                self.pauseButton.setTitle("PAUSE", for: .normal)
                self.paused = false
            }
        }
    }
    
    @IBAction func onResetButtonClick(_ sender: UIButton) {
        resetAudioPlayer.play()
        StopTimer()
    }
}

