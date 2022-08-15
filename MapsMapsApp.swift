//
//  MapsMapsApp.swift
//  MapsMaps
//
//  Created by 小平裕 on 2022/08/13.
//

import SwiftUI

@main
struct MapsMapsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LocalSearchService())
    }
}
}
