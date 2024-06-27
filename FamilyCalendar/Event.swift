//
//  Event.swift
//  FamilyCalendar
//
//  Created by Benjamin Couch on 27/6/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Event: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var description: String
    var startTime: Date
    var endTime: Date
}
