//
//  ViewController.swift
//  ToDo List
//
//  Created by Sushrut Shastri on 2017-02-25.
//  Copyright © 2017 Sushrut Shastri. All rights reserved.
//  Student ID: 300849151
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //Array of Task entity
    var tasks : [Task] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        return cell
    }
   
    //function to get data from coreData
    func getData(){
        //Access coreData database
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Fill the array with the tasks in the coreData database
                do{
                    tasks = try context.fetch(Task.fetchRequest())
                  }
                catch{
                        print("Failed")
                     }
        
        }
    
    //Function for Swipe to delete Functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            context.delete(task)
            
            //To update coreData database after deletion
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            //Refill and reload the Talbeview with updated Data from coreData database
            do{
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch{
                print("Failed")
            }
            tableView.reloadData()
        }
        
    }
  
    //Open UpdateViewController to update task
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateSegue"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destVC = segue.destination as! UpdateTaskViewController
                destVC.titleText = tasks[indexPath.row].title
                destVC.descriptionText = tasks[indexPath.row].desc
            }
    }
    
  
    
    }
    
    
    
    
    

}

