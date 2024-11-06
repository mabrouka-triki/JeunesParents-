//
//  ContentView.swift
//  JeunesParents
//
//  Created by Apprenant174 on 29/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        

        TabView{
            
            Screen3()
                .tabItem {
                    Label("Ma famille", systemImage: "figure.2.and.child.holdinghands")
                    
                }
            Screen4()
                .tabItem {
                    Label("Mon profil", systemImage: "person")
                }
            Screen6()
                .tabItem {
                    Label("Agenda", systemImage: "calendar")
                }
        }.tint(.orange)
    }
}


#Preview {
    ContentView()
        .environmentObject(TaskData())
}
