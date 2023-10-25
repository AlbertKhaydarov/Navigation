//
//  MainView.swift
//  Navigation
//
//  Created by Admin on 23.10.2023.
//

import SwiftUI

struct MainView<MainRouter: Router>: View where MainRouter.Route == MainRoute {
    let router: MainRouter
    
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding()
                    .navigationTitle("Main")
                
                router.viewFor(route:
                        .loginView(data: "Login")) {
                            Text("Переход на логин")
                        }
            }
        }
    }
}

struct LoginView: View {
    let text: String
    var body: some View {
        Text(text)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView(router: MainRouter.init())
    }
}
