//
//  screen1.swift
//  JeunesParents
//
//  Created by Apprenant120 on 31/10/2024.
//

import SwiftUI

struct Screen1: View {
    var body: some View {
        
        NavigationStack{
            
            VStack {
                
                HStack{
                    Image("ZenTask")
                    
                        .resizable()
                        .padding([.top, .bottom])
                        .frame(width: 400, height: 400)
                        .clipped()
                    
                    
                    
                }
                
                
                HStack{
                    
                    Text("Liberez votre esprit ✔︎")
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .italic()
                        .foregroundColor(.colorBlue)
                    
                    
                }
                .padding(.top)
                
                VStack{
                    
                    NavigationLink(destination: Screen2()) {
                        
                        Text("Créer une famille")
                            .padding()
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(15)
                            .bold()
                        
                    }
                }
                
                .padding()
                .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                
                
                Spacer()
                
            }
        }
    }
}



struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1()
            .environmentObject(TaskData())
    }
}

