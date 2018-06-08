//
//  ViewController.swift
//  iContact
//
//  Created by Ming-Ta Yang on 2018/6/5.
//  Copyright © 2018年 Ming-Ta Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        performSegue(withIdentifier: "InitialSegue", sender: nil)

    }
}

