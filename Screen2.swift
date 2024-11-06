//
//  Screen2.swift
//  JeunesParents
//
//  Created by Apprenant174 on 31/10/2024.
//

import SwiftUI

struct Screen2: View {
    
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var text3 = ""
    @State private var selectedRole = Role.parent
    
    
    
    
    
    
    var body: some View {
        
        
        
        NavigationStack{
            
            VStack{
                
                
                Text("\(users[0].familyName) 👋")
                    .bold()
                    .font(.title)
                    .frame(maxWidth:.infinity,alignment: .center)
                    .foregroundColor(.colorBlue)
                
                
                Image("ZenTask")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipped()
                
            }
            
            
            
            
            Spacer()
            
            Text("Nom ou surnom")
                .fontWeight(.bold)
                .foregroundColor(Color("ColorBlue"))
            TextField("Nom ou surnom ...", text: $text2)
                .padding()
                .frame(width:350.0, height:50.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black)
                        .frame(width: 350, height: 50)
                )
            
            
            
                .padding()
            VStack {
                Text("Rôle")
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorBlue"))
                
                Picker("Rôle", selection: $selectedRole) {
                    ForEach(Role.allCases, id: \.self) { role in
                        Text(role.rawValue)
                    }
                }
                .tint(.orange)
                
                
                
                Spacer()
                
                
                
                VStack{
                    
                    
                    Button(action: {
                        
                        
                    }, label: {
                        Text("VALIDER")
                            .padding()
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(15)
                            .bold()
                    })
                    
                    
                    //
                    //                                            NavigationLink(destination: Screen3()) {
                    //
                    //                                                Text("VALIDER")
                    //                                                    .padding()
                    //                                                    .foregroundColor(.white)
                    //                                                    .background(.orange)
                    //                                                    .cornerRadius(15)
                    //                                                    .bold()
                    //
                    //                                            }
                    //                                        }
                    
                }.navigationTitle("BIENVENUE FAMILLE")
                    .navigationBarTitleDisplayMode(.inline)
                    .frame(maxWidth:.infinity,alignment: .center)
            }
        }
    }
}



struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2()
            .environmentObject(TaskData())
    }
}

