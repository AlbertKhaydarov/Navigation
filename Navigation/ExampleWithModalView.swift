//
//  ExampleWithModalView.swift
//  Navigation
//
//  Created by Admin on 23.10.2023.
//

import SwiftUI

struct ExampleWithModalView: View {
    @State var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding(8)
                
                Button("Показать ошибку") {
                showingSheet = true
                }
                    .padding(8)
            }
            .navigationBarTitle(Text("ExampleWithModalView"), displayMode: .inline)
            //для IOS 14+
            .alert(isPresented: $showingSheet) {
                Alert(title: Text("Immportannt message"),
                      message: Text("Wear sunscreen"),
                      dismissButton: .default(Text("Got it!")))
            }
                            
            //для IOS 15+
//            .alert("Ошибка",
//                   isPresented: $showingSheet, actions: {
//                Button("Ok", role: .cancel) {
//                    print("Ошибка")
//                }
//                Button("1", role: .none) {
//                    print("1")
//                }
//                Button("2", role: .none) {
//                    print("2")
//                }
//            })
            
            
//            .sheet(isPresented: $showingSheet) {
//                ModalLoginView(showingSheet: $showingSheet,
//                               text: "Login")
//            }
            .fullScreenCover(isPresented: $showingSheet) {
               
                            ModalLoginView(showingSheet: $showingSheet,
                                           text: "Login")
                        }
        }
        
       
    }
}

struct ExampleWithModalView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleWithModalView()
    }
}
