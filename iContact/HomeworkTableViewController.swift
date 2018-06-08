//
//  HomeworkTableViewController.swift
//  iContact
//
//  Created by Ming-Ta Yang on 2018/6/6.
//  Copyright © 2018年 Ming-Ta Yang. All rights reserved.
//

import UIKit

class HomeworkTableViewController: UITableViewController {
    let userDefaults = UserDefaults.standard
    
    var homeworkList = [Homework]()
    //    var assingDateList = [AssignDate]()
    
    
    
    @IBOutlet weak var editHomeworkBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var addHomeworkBarButtonItem: UIBarButtonItem!
    
    @objc func updateHomework(noti: Notification) -> () {
        
        if let homework = noti.userInfo!["updateHomework"] as? Homework {
            if let indexPath = tableView.indexPathForSelectedRow{
                
                homeworkList[indexPath.row] = homework
            }else{
                homeworkList.insert(homework, at: 0)
            }
            tableView.reloadData()
            
            saveData()
            
        }
        
        
        
       
        
    }
    
    func saveData(){
        let homeworkDics = homeworkList.map { (homework) -> [String : Any?] in
            
            
            return ["id":homework.id,
                    "classId":homework.classId,
                    "subject":homework.subject,
                    "subjectId":homework.subjectId,
                    "teacher":homework.teacher,
                    "teacherId":homework.teacherId,
                    "title":homework.title,
                    "content":homework.content,
                    "date":homework.date,
                    ]
            
        }
        
        userDefaults.set(homeworkDics, forKey: "homeworkList")
        
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
        
        
        
        if let homeworkDics = userDefaults.array(forKey: "homeworkList") as? [[String:Any?]]{
            
            let homeworkList = homeworkDics.map { homeworkDic -> Homework in
              
                
                let id  = homeworkDic["id"] as! Int
                let classId  = homeworkDic["classId"] as! Int
                let subject  = homeworkDic["subject"] as! String
                let subjectId  = homeworkDic["subjectId"] as! Int
                let teacher  = homeworkDic["teacher"] as! String
                let teacherId  = homeworkDic["teacherId"] as! Int
                let title  = homeworkDic["title"] as! String
                let content  = homeworkDic["content"] as! String
                let date  = homeworkDic["date"] as! Date
                
                return Homework(id: id, subject: subject, teacher: teacher, title: title, content: content, date: date)
                
            }
            
            self.homeworkList = homeworkList
            
        }else{
            homeworkList.append(Homework(id: 1,  subject: "Xcode", teacher: "Peter", title: "Ex02", content: "1234", date: Date()))
            homeworkList.append(Homework(id: 2,  subject: "Swift", teacher: "Peter", title: "Ex02", content: "1234", date: Date()))
            homeworkList.append(Homework(id: 3,  subject: "Xcode", teacher: "Chen", title: "Ex04", content: "234", date: Date()))
            homeworkList.append(Homework(id: 4,  subject: "Java", teacher: "Peter", title: "Ex02", content: "1234", date: Date()))
            homeworkList.append(Homework(id: 5,  subject: "Xcode", teacher: "Kent", title: "Ex02", content: "122341234", date: Date()))
            homeworkList.append(Homework(id: 6,  subject: "Swift", teacher: "Amy", title: "Ex06", content: "123424", date: Date()))
            homeworkList.append(Homework(id: 7,  subject: "Android", teacher: "Peter", title: "Ex01", content: "122334", date: Date()))
            homeworkList.append(Homework(id: 8,  subject: "SQL", teacher: "Zack", title: "Ex02", content: "123423434", date: Date()))
            homeworkList.append(Homework(id: 9,  subject: "Xcode", teacher: "Peter", title: "Ex04", content: "234234", date: Date()))
            homeworkList.append(Homework(id: 10,  subject: "Java", teacher: "Ron", title: "Ex02", content: "12334", date: Date()))
            homeworkList.append(Homework(id: 11,  subject: "Android", teacher: "John", title: "Ex08", content: "5555", date: Date()))
            homeworkList.append(Homework(id: 12,  subject: "Java", teacher: "Peter", title: "Ex07", content: "4545", date: Date()))
            homeworkList.append(Homework(id: 13,  subject: "SQL", teacher: "Peter", title: "Ex09", content: "1212123", date: Date()))
        }
        
        
        //        for Homework in HomeworkList {
        //
        //
        ////            Homework.date
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
        return homeworkList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? HomeworkDetailTableViewCell
        
        cell?.subjectLabel.text = homeworkList[indexPath.row].subject
        cell?.titleLabel.text = homeworkList[indexPath.row].title
        
   
        
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
            homeworkList.remove(at: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let homework = homeworkList[fromIndexPath.row] //取出
        homeworkList.remove(at: fromIndexPath.row) //移除
        homeworkList.insert(homework, at: to.row) //插入
        saveData()
        
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
                controller.homework = homeworkList[indexPath.row]
            }
            
            
            
        }
        
        
        
    }
    
    
}

extension Notification.Name{
    
    static let updateHomework = Notification.Name("updateHomework")
    static let deleteHomework = Notification.Name("deleteHomework")
    
    
}





