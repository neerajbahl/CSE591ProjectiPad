//
//  DetailedViewController.swift
//  CSE591ProjectiPad
//
//  Created by Neeraj Bahl on 5/1/16.
//  Copyright © 2016 edu.asu.msse.nbahl. All rights reserved.
//

import UIKit

class DetailedViewController : UIViewController {
    @IBOutlet weak var observationLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var observationIndex: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print ("View will appear is running")

        let obsDesc = taskMgr.tasks[observationIndex!]
        
        observationLabel.text = obsDesc.name
        descriptionLabel.text = obsDesc.desc
    
    }
    
}
