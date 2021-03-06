//
//  HomeworkDetailTableViewController.swift
//  iContact
//
//  Created by Ming-Ta Yang on 2018/6/6.
//  Copyright © 2018年 Ming-Ta Yang. All rights reserved.
//

import UIKit

class HomeworkDetailTableViewController: UITableViewController {
    var homework:Homework?
    
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    @IBOutlet weak var subjectNavigationItem: UINavigationItem!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var updateBarButtonItem: UIBarButtonItem!
    
    @IBAction func updateHomework(_ sender: UIBarButtonItem) {
        
        guard titleTextField.text != "" else {
            
            let alert = UIAlertController(title: "作業標題不得為空", message: "", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "確定", style: .default, handler: nil)
            
            alert.addAction(alertAction)
            
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        guard subjectTextField.text != "" else {
            
            let alert = UIAlertController(title: "作業科目不得為空", message: "", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "確定", style: .default, handler: nil)
            
            alert.addAction(alertAction)
            
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        
        if let homework = homework {
            homework.subject = subjectTextField.text!
            homework.title = titleTextField.text!
            homework.content = contentTextView.text
        }else{
            homework = Homework(id: 13, subject: subjectTextField.text!, teacher: "Sam", title: titleTextField.text!, content: contentTextView.text, date: Date())
            
        }
        
        
        if let homework = homework{
            NotificationCenter.default.post(name: Notification.Name.updateHomework, object: nil, userInfo: ["updateHomework":homework])
        }
        performSegue(withIdentifier: "unwindToHomeworkOverview", sender: nil)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //假如是透過點擊cell進來
        if let homework = homework {
            
            titleNavigationItem.title = "作業編輯"
            subjectTextField.text = homework.subject
            titleTextField.text = homework.title
            contentTextView.text = homework.content
      
        }
      
        
       
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
