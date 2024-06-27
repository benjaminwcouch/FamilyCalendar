//
//  AddMockData.swift
//  FamilyCalendar
//
//  Created by Benjamin Couch on 27/6/2024.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

struct AddMockDataView: View {
    @State private var message: String = ""

    var body: some View {
        VStack {
            Text(message)
                .padding()
            Button(action: addMockData) {
                Text("Add Mock Data")
            }
        }
    }

    func addMockData() {
        let db = Firestore.firestore()
        
        let mockEvents: [[String: Any]] = [
            [
                "title": "Meeting with Bob",
                "description": "Discuss project updates",
                "startTime": Timestamp(date: Date()),
                "endTime": Timestamp(date: Date().addingTimeInterval(3600))
            ],
            [
                "title": "Lunch with Alice",
                "description": "Discuss marketing strategy",
                "startTime": Timestamp(date: Date().addingTimeInterval(7200)),
                "endTime": Timestamp(date: Date().addingTimeInterval(10800))
            ],
            [
                "title": "Dentist Appointment",
                "description": "Regular check-up",
                "startTime": Timestamp(date: Date().addingTimeInterval(14400)),
                "endTime": Timestamp(date: Date().addingTimeInterval(16200))
            ]
        ]

        for event in mockEvents {
            db.collection("events").addDocument(data: event) { error in
                if let error = error {
                    print("Error adding document: \(error.localizedDescription)")
                    self.message = "Error adding document: \(error.localizedDescription)"
                } else {
                    print("Document added successfully")
                    self.message = "Mock data added successfully"
                }
            }
        }
    }
}
