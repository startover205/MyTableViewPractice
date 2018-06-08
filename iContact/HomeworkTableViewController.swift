//
//  HomeworkTableViewController.swift
//  iContact
//
//  Created by Ming-Ta Yang on 2018/6/6.
//  Copyright © 2018年 Ming-Ta Yang. All rights reserved.
//

import UIKit

var isTeacher = true

class HomeworkTableViewController: UITableViewController {
    var homeworkIsDoneList = [Homework]()
    //    var assingDateList = [AssignDate]()
    
    
    
    @IBOutlet weak var editHomeworkBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var addHomeworkBarButtonItem: UIBarButtonItem!
    
    @objc func updateHomework(noti: Notification) -> () {
        
        if let homework = noti.userInfo!["updateHomework"] as? Homework {
            if let indexPath = tableView.indexPathForSelectedRow{
                
                homeworkIsDoneList[indexPath.row] = homework
            }else{
                homeworkIsDoneList.insert(homework, at: 0)
            }
            tableView.reloadData()
            
        }
        
        
        
    }
    
    
    @IBAction func startEditMode(_ sender: UIBarButtonItem) {
        
        isEditing = !isEditing
        if isEditing {
            editHomeworkBarButtonItem.title = "完成"
        }else{
            editHomeworkBarButtonItem.title = "編輯"

        }
        
        
    }
    
    
    @IBAction func unwindToHomeworkOverview(_ sender: UIStoryboardSegue) {
        //        let sourceViewController = sender.sourceViewController
        // Use data from the view controller which initiated the unwind segue
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //接收通知
        NotificationCenter.default.addObserver(self, selector: #selector(updateHomework(noti:)), name: Notification.Name.updateHomework, object: nil)
        
        
        //非老師
        if isTeacher == false {
            addHomeworkBarButtonItem.isEnabled = false
            addHomeworkBarButtonItem.tintColor = .clear
            
        }
        
        
        
        
        homeworkIsDoneList.append(HomeworkIsDone(id: 1,  subject: "Xcode", teacher: "Peter", title: "Ex02", content: "1234", date: Date(), isHomeworkDone: false))
        homeworkIsDoneList.append(HomeworkIsDone(id: 2,  subject: "Swift", teacher: "Peter", title: "Ex02", content: "1234", date: Date(), isHomeworkDone: true))
        homeworkIsDoneList.append(HomeworkIsDone(id: 3,  subject: "Xcode", teacher: "Chen", title: "Ex04", content: "234", date: Date(), isHomeworkDone: true))
        homeworkIsDoneList.append(HomeworkIsDone(id: 4,  subject: "Java", teacher: "Peter", title: "Ex02", content: "1234", date: Date(), isHomeworkDone: true))
        homeworkIsDoneList.append(HomeworkIsDone(id: 5,  subject: "Xcode", teacher: "Kent", title: "Ex02", content: "122341234", date: Date(), isHomeworkDone: false))
        homeworkIsDoneList.append(HomeworkIsDone(id: 6,  subject: "Swift", teacher: "Amy", title: "Ex06", content: "123424", date: Date(), isHomeworkDone: true))
        homeworkIsDoneList.append(HomeworkIsDone(id: 7,  subject: "Android", teacher: "Peter", title: "Ex01", content: "122334", date: Date(), isHomeworkDone: true))
        homeworkIsDoneList.append(HomeworkIsDone(id: 8,  subject: "SQL", teacher: "Zack", title: "Ex02", content: "123423434", date: Date(), isHomeworkDone: false))
        homeworkIsDoneList.append(HomeworkIsDone(id: 9,  subject: "Xcode", teacher: "Peter", title: "Ex04", content: "234234", date: Date(), isHomeworkDone: false))
        homeworkIsDoneList.append(HomeworkIsDone(id: 10,  subject: "Java", teacher: "Ron", title: "Ex02", content: "12334", date: Date(), isHomeworkDone: true))
        homeworkIsDoneList.append(HomeworkIsDone(id: 11,  subject: "Android", teacher: "John", title: "Ex08", content: "5555", date: Date(), isHomeworkDone: true))
        homeworkIsDoneList.append(HomeworkIsDone(id: 12,  subject: "Java", teacher: "Peter", title: "Ex07", content: "4545", date: Date(), isHomeworkDone: false))
        homeworkIsDoneList.append(HomeworkIsDone(id: 13,  subject: "SQL", teacher: "Peter", title: "Ex09", content: "1212123", date: Date(), isHomeworkDone: false))
        
        
        //        for homeworkIsDone in homeworkIsDoneList {
        //
        //
        ////            homeworkIsDone.date
        ////            let assignDate = AssignDate(assinDate: Date)
        //
        //
        //
        //
        //
        //        }
        
        
        
        
        
        
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homeworkIsDoneList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? HomeworkDetailTableViewCell
        
        cell?.subjectLabel.text = homeworkIsDoneList[indexPath.row].subject
        cell?.titleLabel.text = homeworkIsDoneList[indexPath.row].title
        
        if isTeacher == false, let homeworkIsDone = homeworkIsDoneList[indexPath.row] as? HomeworkIsDone{
            
            cell?.completionLabel.isHidden = false
            
            if homeworkIsDone.isHomeworkDone! {
                cell?.completionLabel.text = ""
                
            }else{
                cell?.completionLabel.text = "未完成"
                
            }
        }
        
        return cell!
    }
    
 
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
        homeworkIsDoneList.remove(at: indexPath.row)
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {

     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }



     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let homework = homeworkIsDoneList[fromIndexPath.row] //取出
        homeworkIsDoneList.remove(at: fromIndexPath.row) //移除
        homeworkIsDoneList.insert(homework, at: to.row) //插入
        
     
     }
    
    
    
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
        
        
     return true
     }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if let controller = segue.destination as? HomeworkDetailTableViewController{
            
            if let indexPath = tableView.indexPathForSelectedRow{
                controller.homework = homeworkIsDoneList[indexPath.row]
            }
            
            
            
        }
        
        
        
    }
    
    
}

extension Notification.Name{
    
    static let updateHomework = Notification.Name("updateHomework")
    static let deleteHomework = Notification.Name("deleteHomework")
    
    
}





