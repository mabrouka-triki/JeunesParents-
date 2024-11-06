//
//  StructureUser.swift
//  JeunesParents
//
//  Created by Apprenant174 on 29/10/2024.
//

import Foundation

struct User: Identifiable, Hashable {
    
    var id = UUID ()
    var image: String
    var familyName: String
    var name: String
    var role: Role
    
}

enum Role: String, CaseIterable {
    case parent = "Parent"
    case enfant = "Enfant"
    case grandParent = " Grand Parent"
}


var users = [
    User(image: "imageMaryama", familyName: "Mamaher", name: "Maryama", role: Role.parent),
    User(image: "imageHervé", familyName: "Mamaher", name: "Hervé", role: Role.grandParent ),
    User(image: "imageMabrouka", familyName: "Mamaher", name: "Mabrouka", role: Role.parent),
    User(image: "imageUser1", familyName: "Mamaher", name: "Adam", role: Role.enfant)

]
