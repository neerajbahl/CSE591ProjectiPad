//
//  FirstViewController.swift
//  CSE591ProjectiPad
//
//  Created by Neeraj Bahl on 4/27/16.
//  Copyright © 2016 edu.asu.msse.nbahl. All rights reserved.
// Reference:
// https://www.youtube.com/watch?v=war0gHL26ns
// http://stackoverflow.com/questions/24062285/how-to-set-uitableviewcellstylesubtitle-and-dequeuereusablecell-in-swift
//


import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableTasks: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // To return to the list
    override func viewWillAppear(_ animated: Bool) {
        tableTasks.reloadData()
    }
    
    // For the delete functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            print ("Deleting the row")
            taskMgr.tasks.remove(at: indexPath.row)
            tableTasks.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return taskMgr.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell =  UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "test")
    
            cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
            cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
            cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].sequenceObservation
            cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].dateObservation
        
        
        return cell

}
}
