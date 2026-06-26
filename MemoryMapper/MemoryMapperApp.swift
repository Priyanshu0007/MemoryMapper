//
//  MemoryMapperApp.swift
//  MemoryMapper
//
//  Created by Priyanshu Gupta on 30/06/26.
//

import SwiftUI
import SwiftData

@main
struct MemoryMapperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memory.self)
        }
    }
}
