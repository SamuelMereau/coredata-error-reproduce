//
//  PresetMessage+CoreDataProperties.swift
//  URLSessionJSONRequests
//
//  Created by Samuel Mereau on 11/10/19.
//  Copyright © 2019 Kyle Lee. All rights reserved.
//

import Foundation
import CoreData

extension ClientData {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClientData>{
        return NSFetchRequest<ClientData>(entityName: "ClientData")
    }
    
    @NSManaged public var presetMessage: String?
        
}


