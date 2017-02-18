//
//  AddItemViewController.swift
//  Project ios
//
//  Created by Guest User on 18/02/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

protocol changeValueDelegate {
    func updateData(data: Scary)
}


class AddItemViewController: UIViewController {
    
     var delegate: changeValueDelegate?

    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Subtitle: UILabel!
     @IBOutlet weak var Name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Description.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        Description.layer.borderWidth = 1.0;
        Description.layer.cornerRadius = 5.0;
        // Do any additional setup after loading the view.
    }
    @IBAction func Save(_ sender: Any) {
        
        if Name.text == "" || Subtitle.text == "" || Description.text == "" {
            
            AlertMessage(Input: "Define the fields.")
            
        }else if !isValidInput(Input: Name.text!) {
            
            AlertMessage(Input: "Name should only contain Letters,Digits or Underscores.")
            
            
            AlertMessage(Input: "Subtitle should only contain Letters,Digits or Underscores.")
            
        }else{
            
            let model = Scary.init(Name: Name.text!, Picture:  nil, Subtitle: Subtitle.text!, Description: Description.text!);
            
            self.delegate?.updateData(data: model);
            
            _ = navigationController?.popViewController(animated: true)
        }
        
    }

    



    func AlertMessage(Input:String){
        let alertController = UIAlertController(title: "Error", message: Input, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
    
    // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
        (result : UIAlertAction) -> Void in
        print("OK")
    }
    
    alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
}

    func isValidInput(Input:String) -> Bool {
        let RegEx = "\\A\\w{1,20}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
}
