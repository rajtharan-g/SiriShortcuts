//
//  ViewController.swift
//  SiriShortcuts
//
//  Created by Rajtharan G on 23/02/19.
//  Copyright © 2019 Rajtharan G. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupUserActivity(userInfo: Dictionary<String, Any>) {
        let activity = NSUserActivity(activityType: "com.infivention.SiriShortcuts.Detail")
        activity.title = "Open \(userInfo["screen"] ?? "detail") screen"
        activity.userInfo = userInfo
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier( "com.infivention.SiriShortcuts.Detail")
        view.userActivity = activity
        activity.becomeCurrent()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail1" {
            setupUserActivity(userInfo: ["screen":"detail1"])
        } else if segue.identifier == "detail2" {
            setupUserActivity(userInfo: ["screen":"detail2"])
        }
    }

}

