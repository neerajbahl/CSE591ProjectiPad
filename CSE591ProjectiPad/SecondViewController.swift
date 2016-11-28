//
//  SecondViewController.swift
//  CSE591ProjectiPad
//
//  Created by Neeraj Bahl on 4/27/16.
//  Copyright © 2016 edu.asu.msse.nbahl. All rights reserved.
//
// References:
// https://www.youtube.com/watch?v=war0gHL26ns


import UIKit


class SecondViewController: UIViewController, UITextFieldDelegate {
    
    // Outlet Actions
    @IBOutlet var textTask: UITextField!
    @IBOutlet var textDesc: UITextField!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var sequenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .medium
        let dateString = formatter.string(from: date)
        self.timestampLabel.text = dateString
        let uuid = UUID().uuidString
        self.sequenceLabel.text = uuid
        print(uuid)
        
    }

    // Events
    
    @IBAction func btnAddTaskClick (_ sender: UIButton) {
        print ("Add Button is clicked")
        taskMgr.addTask(textTask.text!, desc: textDesc.text!, dateObservation: timestampLabel.text!, sequenceObservation: sequenceLabel.text!)
        self.view.endEditing(true)
        textTask.text = ""
        textDesc.text = ""
        self.tabBarController?.selectedIndex = 0
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
        // UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "test")
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        
        return cell
    }
    
    
    // Handles the deleting aspect of the table view
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath){
        
        if(editingStyle == UITableViewCellEditingStyle.delete){
            taskMgr.tasks.remove(at: indexPath.row)
            tableView.reloadData();
            
        }
    }
    
    var selectedRow: Int?
    
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath){
        selectedRow = indexPath.row
        performSegue(withIdentifier: "ShowObservationSegue", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let segueIdentifier = "ShowObservationSegue"
        if(segue.identifier == segueIdentifier){
            if let destination = segue.destination as? DetailedViewController{
                destination.observationIndex = selectedRow! as Int
            }
            
        }
    

}

}
