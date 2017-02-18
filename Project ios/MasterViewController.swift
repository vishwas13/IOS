//
//  MasterViewController.swift
//  Project ios
//
//  Created by Guest User on 18/02/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit
extension MasterViewController: changeValueDelegate {
    func updateData(data: Scary ) {
        let project = Scary.init(Name: data.Name, Picture: UIImage(named : "image1"), Subtitle: data.Subtitle, Description: data.Description)
        self.itemArray.append(project)
        self.tableView.reloadData()
    }
}


class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
    let project1 = Scary.init(Name: "Vishwas", Picture: UIImage(named : "image1"), Subtitle: "FIFA", Description: "Game ")
    
    let project2 = Scary.init(Name: "Hari", Picture: UIImage(named : "image2"), Subtitle: "CounterStrike", Description: "Playing")
    
    let project3 = Scary.init(Name: "Babar", Picture: UIImage(named : "image3"), Subtitle: "Searching", Description: "Internship")
    
    var itemArray = [(Scary)]()

    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemArray.append(project1)
        itemArray.append(project2)
        itemArray.append(project3)
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        
       
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.Proj = itemArray[(indexPath.row)]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }else if segue.identifier == "addIdentifier"{
            (segue.destination as! AddItemViewController).delegate = self
    }

    // MARK: - Table View

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell

        let data = itemArray[indexPath.row]
        // Configure the cell...
        
        cell?.Name.text = data.Name
        cell?.Subtitle.text = data.Subtitle
        cell?.TestImage.image = data.Picture
        
        return cell!
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}
}
