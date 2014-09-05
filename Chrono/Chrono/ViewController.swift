//
//  ViewController.swift
//  Chrono
//
//  Created by Jorge Mendoza on 8/28/14.
//  Copyright (c) 2014 JorgeMendoza. All rights reserved.
//

/*
The MIT License (MIT)

Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import UIKit

class ViewController: UIViewController {
    
   @IBOutlet var chronoLabel:UILabel? = UILabel()

    var counter = 0
    var timer = NSTimer()
    var paused = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startChrono() {
     
        self.startTimer()
    }
    
    @IBAction func pauseChrono(){

        self.pauseTimter()
    }
    
    func startTimer(){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector("updateLabel"), userInfo: nil, repeats: true)
    }
    
    func pauseTimter() {
        
        if !paused {
            
            paused = true
        } else {
            paused = false
        }
    }
    
    func updateLabel(){
        
        if !paused {
            self.chronoLabel?.text = self.timerString(counter++)
        }
        
    }
    
    func timerString(milliseconds:Int) -> String {
        
        var milliStr = "000"
        var sencondStr = "00"
        var minuteStr = "00"
        
        
        var milli:Int = milliseconds
        var seconds:Int  =  (milliseconds / 1000) % 60
        var minutes:Int =  ((milliseconds / (1000*60)) % 60)

        if seconds > 59 {
            
            seconds = seconds - (seconds * 60)
        }
        
        if milliseconds > 999 {
            
            milli =  milliseconds - (minutes * 60*1000 ) - (seconds * 1000)

        }
        
        switch milli {
            
        case 0 ... 9:
            milliStr = "00\(milli)"
            break
        case 10 ... 99:
            milliStr = "0\(milli)"
            break
        case 100 ... 999:
            milliStr = "\(milli)"
            break
        default:
            break
        }
        
        
        switch seconds {
            
        case 0 ... 9:
            sencondStr = "0\(seconds)"
            break
        case 10 ... 59:
            sencondStr = "\(seconds)"
            break
        default:
            break
        }
        
        return "\(minutes):" + sencondStr + ":" + milliStr
    }
}

