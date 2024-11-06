//
//  JeunesParentsApp.swift
//  JeunesParents
//
//  Created by Apprenant174 on 29/10/2024.
//

import SwiftUI

@main
struct JeunesParentsApp: App {
    @StateObject var taskData = TaskData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskData)
        }
    }
}
