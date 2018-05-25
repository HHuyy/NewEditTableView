//
//  ViewController.swift
//  NewEditTableView
//
//  Created by tham gia huy on 5/9/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var so: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = String(so ?? 0)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        so = Int(textField.text ?? "")
    }
}

