//
//  FirestoreService.swift
//  FamilyCalendar
//
//  Created by Benjamin Couch on 27/6/2024.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

class FirestoreService: ObservableObject {
    private let db = Firestore.firestore()
    
    @Published var events: [Event] = []

    func fetchEvents(completion: @escaping (Result<[Event], Error>) -> Void) {
        db.collection("events").getDocuments { querySnapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let fetchedEvents = try querySnapshot?.documents.compactMap {
                    try $0.data(as: Event.self)
                } ?? []
                DispatchQueue.main.async {
                    self.events = fetchedEvents
                }
                completion(.success(fetchedEvents))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
