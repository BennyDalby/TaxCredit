//
//  ViewController.swift
//  TaxCredit
//
//  Created by Test on 7/20/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func enterGasTapped(_ sender: Any) {
        
     
     let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
     let nextViewController = storyBoard.instantiateViewController(withIdentifier: "gaslistView") as! GasViewController
      self.present(nextViewController, animated:true, completion:nil)
                       
                       
        
    
    }
    
}

