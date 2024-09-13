//
//  Routing.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import Foundation


enum Route {
    case products
    case favorites
    case cart
}

class Router: ObservableObject {
    @Published var currentRoute: Route = .products

    func navigate(to route: Route) {
        currentRoute = route
    }
}
