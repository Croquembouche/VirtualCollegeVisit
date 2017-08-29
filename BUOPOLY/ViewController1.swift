//
//  ViewController.swift
//  VirtualCollegeVisit
//
//  Created by HeWilliam on 4/5/17.
//  Copyright © 2017 HeWilliam. All rights reserved.
//

import UIKit

class ViewController_1: UIViewController {

    @IBOutlet weak var accesscode: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "tomapSegue"){
            let nextScene = segue.destination as? ViewController_2
            nextScene?.valid_code = accesscode.text
        }
            
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

