//
//  ViewController.swift
//  Calculator
//
//  Created by Ali imran on 19/09/2021.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0
    var previouNumber:Double = 0
    var performingMath = false
    var operation = 0
  
    
    @IBOutlet weak var labelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        if performingMath == true{
            labelView.text = String(sender.tag - 1)
            numberOnScreen = Double(labelView.text!)!
            performingMath = false
            
        }
        else{
        labelView.text = labelView.text! + String(sender.tag-1)
        numberOnScreen = Double(labelView.text!)!
        }
        
    }
    
    @IBAction func Decimal(_ sender: UIButton) {
        if performingMath || labelView.text!.isEmpty
            {
                labelView.text = "0."
                performingMath = false
            }
            else
            {
                if !labelView.text!.contains(".") {
                    labelView.text = labelView.text! + "."
                }
            }
            numberOnScreen = Double(labelView.text!)!
    }
    @IBAction func arthimaticButtons(_ sender: UIButton) {
        if sender.tag != 16 && sender.tag != 15{
            previouNumber = Double(labelView.text!)!
            if sender.tag == 11{
                
                labelView.text = "÷"
                
            } // divide Function
            if sender.tag == 12{
                
                labelView.text = "x"
                
            } // multiply Function
            if sender.tag == 13{
                
                labelView.text = "+"
                
            } // Plus Function
            if sender.tag == 14{
                
                labelView.text = "-"
                
            }
          
            // minus function
          
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16{
            labelView.text = ""
            performingMath = false
            numberOnScreen = 0
            operation = 0
            previouNumber = 0
        }
         if sender.tag == 19{
            if operation == 19{
                labelView.text = String(numberOnScreen / 100)
            }
          
        }
         if sender.tag == 18{
            labelView.text = String(-numberOnScreen)
        }
        else if sender.tag == 15{
            if operation == 11{
                labelView.text = String(previouNumber / numberOnScreen)
            }// divide
            else if operation == 12{
                labelView.text = String(previouNumber * numberOnScreen)
            }// multiply
           else if operation == 13{
            labelView.text = String(previouNumber + numberOnScreen)
            }// plus
            else if operation == 14{
                labelView.text = String(previouNumber - numberOnScreen)
            }
           
            
        }
    }
    
}

