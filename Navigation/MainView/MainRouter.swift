//
//  MainRouter.swift
//  Navigation
//
//  Created by Admin on 23.10.2023.
//

import SwiftUI

enum MainRoute {
    case loginView(data: String)
}

struct MainRouter: Router {
    
    typealias Route = MainRoute
    var usingNavigation = true
    
    func viewFor<T>(route: MainRoute, content: () -> T) -> AnyView where T : View {
        switch route {
        case let .loginView(data):
            if usingNavigation {
                return AnyView(NavigationLink(destination:
                                                LoginView(text: data)) {
                    content()
                })
            } else {
                return AnyView(Button(action: {}) {
                    content()
                })
            }
        }
    }
    
}
