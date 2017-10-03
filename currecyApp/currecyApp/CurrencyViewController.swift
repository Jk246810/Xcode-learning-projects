//
//  CurrencyViewController.swift
//  currecyApp
//
//  Created by Brian on 6/21/17.
//  Copyright © 2017 jamee. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    @IBOutlet weak var currencyFromField: UITextField!
    
    @IBOutlet weak var currencyToField: UITextField!
    
    
    
    @IBAction func calculateButton(_ sender: Any) {
        let usd = currencyFromField.text
        if let usd = usd{
            let bitcoin = Double(usd)! * 0.00038
            currencyToField.text = String(bitcoin)
        }
        
        
        //0.00038
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
