//
//  ViewController.swift
//  ToDoList
//
//  Created by Валерия  on 24.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addtask(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let contactName = textfield.text!
        
        var newContact = ContactItem()
        
        newContact.name = contactName
        
        do {
            if let data = defaults.data(forKey: "contactItemArray") {
                var array = try JSONDecoder().decode([ContactItem].self, from: data)
                
                array.append(newContact)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "contactItemArray")
            } else {
                let encodedata = try JSONEncoder().encode([newContact])
                
                defaults.set(encodedata, forKey: "contactItemArray")
            }
            
        } catch {
            print("unable to encode \(error)")
        }
        
        textfield.text = ""
    }
    
}

