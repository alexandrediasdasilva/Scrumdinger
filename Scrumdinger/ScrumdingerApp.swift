//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Alexandre Dias Da Silva on 25/05/2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.data)
            }
        }
    }
}
