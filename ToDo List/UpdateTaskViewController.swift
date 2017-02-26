//
//  EditTaskViewController.swift
//  ToDo List
//
//  Created by Sushrut Shastri on 2017-02-26.
//  Copyright © 2017 Sushrut Shastri. All rights reserved.
//  Student ID: 300849151
//

import UIKit

class UpdateTaskViewController: UIViewController {
    
    var titleText: String?
    var descriptionText: String?

    @IBOutlet weak var mydesc: UITextField!
    @IBOutlet weak var taskTitle: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let titleText = titleText{
            taskTitle.text = titleText
        }
        if let descriptionText = descriptionText{
            mydesc.text = descriptionText
        }
    }
//Update Task
    @IBAction func btnUpdate(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.title = taskTitle.text!
        task.desc = mydesc.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
        
        
    }
   

}
