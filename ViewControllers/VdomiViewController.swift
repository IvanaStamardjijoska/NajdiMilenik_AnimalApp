//
//  VdomiViewController.swift
//  Project
//
//  Created by CodeWell on 12/22/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class VdomiViewController: UIViewController {

    @IBOutlet weak var vdomiImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        vdomiImage.layer.cornerRadius = 30
         vdomiImage.clipsToBounds = true
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
