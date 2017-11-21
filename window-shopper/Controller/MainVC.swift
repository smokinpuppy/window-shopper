//
//  MainVC.swift
//  window-shopper
//
//  Created by Robert Haddad on 11/21/17.
//  Copyright © 2017 Robert Haddad. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hours: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.7066350437, blue: 0.1859614481, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
        resultLbl.isHidden = true
        hours.isHidden = true
        
        wageTxt.text = ""
        priceTxt.text = ""
    }

    @objc func calculate(){
        if let wageTxt = wageTxt.text, let priceTxt = priceTxt.text {
            if let wage = Double(wageTxt), let price = Double(priceTxt){
                view.endEditing(true)
                resultLbl.isHidden = false
                hours.isHidden = false
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    }

    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultLbl.isHidden = true
        hours.isHidden = true
        
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
}

