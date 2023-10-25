//
//  RouterProtocol.swift
//  Navigation
//
//  Created by Admin on 23.10.2023.
//

import SwiftUI

protocol Router {
    associatedtype Route
    func viewFor<T: View>(route: Route, content: () -> T) -> AnyView
}
