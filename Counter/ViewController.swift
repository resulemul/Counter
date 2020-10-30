//
//  ViewController.swift
//  Counter
//
//  Created by Resul Emül on 10/30/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var stepLabel: UILabel!
    
    var count = 0
    var step = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = String(count)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        count += step
        countLabel.text = String(count)
    }
    
    @IBAction func stepChanger(_ sender: UIStepper ) {
        
        if step == 1 && sender.value == 0 {
            sender.value = -1
        }
        if step == -1 && sender.value == 0 {
            sender.value = 1
        }
        step = Int(sender.value)
        if sender.value > 0 {
            stepLabel.text = String("+\(step)")
            plusButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        }else{
            stepLabel.text = String(step)
            plusButton.setBackgroundImage(UIImage(named: "minus"), for: .normal)
        }
        
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Reset", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { [unowned self] (UIAlertAction) in
            count = 0
            step = 1
            countLabel.text = String(count)
            stepLabel.text = String("+\(step)")
            plusButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert,animated: true)
    
    }
    


}

