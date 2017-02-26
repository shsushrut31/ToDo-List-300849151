//
//  AddTaskViewController.swift
//  ToDo List
//
//  Created by Sushrut Shastri on 2017-02-25.
//  Copyright © 2017 Sushrut Shastri. All rights reserved.
//  Student ID: 300849151
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

   
    @IBOutlet weak var taskTitle: UITextField!
    
    @IBOutlet weak var taskDesc: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide Keyboard when Tap anywhere on screen
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddTaskViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Function used for Tao-To-Hide keyboard functionality
    func dismissKeyboard(){
        view.endEditing(true)
    }

    //Add New Task
    @IBAction func btnAddTask(_ sender: UIButton) {
        
        //Access coreData database
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.title = taskTitle.text!
        task.desc = taskDesc.text!
        
        //Save task in coreData database
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Navigate to TableViewController
        navigationController!.popViewController(animated: true)
        
        
        
    }
    

}
