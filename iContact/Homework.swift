//
//  Homework.swift
//  iContact
//
//  Created by Ming-Ta Yang on 2018/6/5.
//  Copyright © 2018年 Ming-Ta Yang. All rights reserved.
//

import Foundation

class Homework:CustomStringConvertible {
    var description: String {
        
        return "id: \(id ), subjectId: \(subjectId), teacherId: \(teacherId), classId: \(classId), subject: \(subject), teacher: \(teacher), title: \(title), content: \(content), date: \(date )"
    }
    
    var id = 0
    var subjectId = 0
    var teacherId = 0
    var classId = 0
    var subject = ""
    var teacher = ""
    var title = ""
    var content = ""
    var date:Date = Date()
    
    init() {
    }
    
    init(id:Int, subject:String, teacher:String, title:String, content:String, date:Date) {
        self.id = id;
        self.subject = subject;
        self.teacher = teacher;
        self.title = title;
        self.content = content;
        self.date = date;
        
    }
    
    init(subjectId:Int, teacherId:Int, classId:Int, title:String, content:String) {
        self.title = title;
        self.content = content;
        self.subjectId = subjectId;
        self.teacherId = teacherId;
        self.classId = classId;
        
    }
    
    
    
    
    
    
    
    
}


