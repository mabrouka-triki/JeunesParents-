//
//  StructureTask.swift
//  JeunesParents
//
//  Created by Apprenant174 on 29/10/2024.
//

import Foundation
import SwiftUI

struct Tache: Identifiable, Hashable {
    
    var id = UUID()
    var taskname : String
    var user: User
    var date: Date
    var recurrence : Recurrence
    var image : String
    var priority : Priorities
   

}


enum Recurrence: String, CaseIterable {
    case never = "Jamais", daily = "Tous les jours" , monthly = "Tous les mois", weekly =  "Toutes les semaines", annualy = "Tous les ans"
}

enum Priorities: String, CaseIterable {
    case exclamationmark = "exclamationmark" , exclamationmark2 = "exclamationmark.2", exclamationmark3 = "exclamationmark.3"
    
    var priority: Color {
        switch self {
        case .exclamationmark:
            return .green
        case .exclamationmark2:
            return .yellow
        case .exclamationmark3:
            return .red
            
        }
    }
}


final class TaskData: ObservableObject {
   @Published var tasks = [
    Tache(taskname: "Aspirateur", user: users[0], date: Date(), recurrence: .weekly, image: "robotic.vacuum.fill", priority: .exclamationmark),
    Tache(taskname: "Préparer le dîner", user: users[1], date: Date(), recurrence: .daily, image: "frying.pan.fill", priority: .exclamationmark2),
    Tache(taskname: "RDV pédiatre", user: users[2], date: Date(), recurrence: .monthly, image: "stethoscope.fill", priority: .exclamationmark3),
    Tache(taskname: "Nourrir le lapin", user: users[3], date: Date(), recurrence: .daily, image: "hare.fill", priority: .exclamationmark3),
    ]
}


