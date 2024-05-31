//
//  reminder.swift
//  rounded2
//
//  Created by Renad alkhathami on 12/06/1445 AH.
//

import Foundation
import SwiftData
@Model
class Riminder {
    var title: String = ""
    var count: Int
    var id: String = UUID().uuidString
    var requestIdentifier: String?
    
    init(title: String, count: Int) {
        self.title = title
        self.count = count
        self.id = UUID().uuidString
        self.requestIdentifier = nil
    }
}
