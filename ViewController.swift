//
//  FourthViewController.swift
//  URLSessionJSONRequests
//
//  Created by Samuel Mereau on 11/10/19.
//  Copyright © 2019 Samuel Mereau. All rights reserved.
//

import UIKit
import CoreData

var text = "Empty Message"

class FourthViewController: UIViewController {
    
    var messageSaved = [ClientData]()
    
    override func viewDidLoad() {
    super.viewDidLoad()

        let fetchRequest: NSFetchRequest<ClientData> = ClientData.fetchRequest()
              
              do {
                  let messageSaved = try PersistenceServce.context.fetch(fetchRequest)
                  self.messageSaved = messageSaved
              } catch let error as NSError {
                  print("Error: \(error.domain)")
              }
        
    }
    
    @IBAction func onCancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func onEditMessageTap(_ sender: Any) {
    
   let alertController = UIAlertController(title: "Edit Preset Message", message: "Enter a new preset message", preferredStyle: .alert)
             alertController.addTextField { textfield in
                 textfield.placeholder = "Your message..."
             }
             alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
             
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
                 text = alertController.textFields!.first!.text!
                let savedMessage = ClientData(context: PersistenceServce.context)
                savedMessage.presetMessage = text
                PersistenceServce.saveContext()
                self.messageSaved.append(savedMessage)
            
                    return
             }))
             self.present(alertController, animated: true)
        
        
        
        
      }
}


