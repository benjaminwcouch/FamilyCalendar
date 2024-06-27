//
//  ContentView.swift
//  FamilyCalendar
//
//  Created by Benjamin Couch on 27/6/2024.
//
import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var isUserAuthenticated = false

    var body: some View {
        Group {
            if isUserAuthenticated {
                CalendarView()
            } else {
                AuthView()
            }
        }
        .onAppear {
            isUserAuthenticated = Auth.auth().currentUser != nil
        }
    }
}
