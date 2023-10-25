//
//  ExampleView.swift
//  Navigation
//
//  Created by Альберт Хайдаров on 23.10.2023.
//

import SwiftUI

struct ExampleView: View {
    
    @State var showingSheet = false
    
    init(){
        UINavigationBar.appearance()
            .backgroundColor = .gray
        
        UINavigationBar.appearance()
            .largeTitleTextAttributes = [
                .foregroundColor: UIColor.darkGray,
                .font: UIFont.systemFont(ofSize: 40)
            ]
        
        UINavigationBar.appearance()
            .titleTextAttributes = [
                .font: UIFont.systemFont(ofSize: 20)
            ]
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding(8)
                
//                NavigationLink {
//                    ExampleLoginView(text: "Login")
//                } label: {
//                    Text("Переход на Login")
//                }
//                .padding(16)
                NavigationLink {
                    ModalLoginView(showingSheet: $showingSheet, text:  "LoginModal")
                } label: {
                    Text("Переход на Login Modal")
                }
              
                Button("Модальный логин") {
                    showingSheet = true
                }
                .sheet(isPresented: $showingSheet) {
                    ModalLoginView(showingSheet: $showingSheet,
                                   text: "LoginModal")
                }
                .padding(8)
                
            }
        
            .navigationBarItems(
                leading:
                    Button(action: {
                        
                    }) {
                        Image(systemName: "minus.square.fill")
                            .font(.largeTitle)
                    }
                    .foregroundColor(.pink),
                trailing:
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus.square.fill")
                            .font(.largeTitle)
                    }
                    .foregroundColor(.yellow)
            )
            
            
            .navigationBarTitle(Text("main"),
                                displayMode: .large)
            .navigationBarHidden(true)
            .sheet(isPresented: $showingSheet) {
                ModalLoginView(showingSheet: $showingSheet,
                               text: "LoginModal")
            }
            .padding()
        }
    }
}

struct ExampleLoginView: View {
    
    let text: String
  
    var body: some View {
        Text(text)
    }
}

struct ModalLoginView: View {
    @Binding var showingSheet: Bool
    let text: String
    var body: some View {
        Text(text)
        
        Button("Close") {
            showingSheet = false
        }
       
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
