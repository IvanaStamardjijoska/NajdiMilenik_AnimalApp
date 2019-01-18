//
//  DoktorViewController.swift
//  Project
//
//  Created by CodeWell on 12/22/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class DoktorViewController: UIViewController {

    @IBOutlet weak var doktorImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        doktorImage.layer.cornerRadius = 30
        doktorImage.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
