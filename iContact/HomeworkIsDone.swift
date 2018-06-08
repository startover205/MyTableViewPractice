//
//  HomeworkIsDone.swift
//  iContact
//
//  Created by Ming-Ta Yang on 2018/6/6.
//  Copyright © 2018年 Ming-Ta Yang. All rights reserved.
//

import Foundation

class HomeworkIsDone: Homework {
    var isHomeworkDone:Bool?
    
    
    init(id:Int, subject:String, teacher:String, title:String, content:String, date:Date, isHomeworkDone:Bool) {
        super.init(id: id, subject: subject, teacher: teacher, title: title, content: content, date: date)
        self.isHomeworkDone = isHomeworkDone;
        
    }
    
}

