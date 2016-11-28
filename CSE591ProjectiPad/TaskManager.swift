//
//  TaskManager.swift
//  CSE591ProjectiPad
//
//  Created by Neeraj Bahl on 4/27/16.
//  Copyright © 2016 edu.asu.msse.nbahl. All rights reserved.
// References:
// https://www.youtube.com/watch?v=war0gHL26ns


import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "Un-Named"
    var desc = "Un-Described"
    var dateObservation = "today"
    var sequenceObservation = "0"
}

class TaskManager: NSObject {
    var tasks = [task]()
    
    func addTask(_ name: String, desc: String, dateObservation: String, sequenceObservation: String) {
        tasks.append(task (name: name, desc: desc, dateObservation: dateObservation, sequenceObservation: sequenceObservation))
    }
}
