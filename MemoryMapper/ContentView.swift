//
//  ContentView.swift
//  MemoryMapper
//
//  Created by Priyanshu Gupta on 30/06/26.
//

import SwiftUI
import MapKit
import CoreLocation

struct Memory: Identifiable{
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var position: MapCameraPosition = .automatic;
    @State private var memories: [Memory] = [
        Memory(title: "Apple Park", coordinate:CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090))
    ]
    var body: some View {
        MapReader{ reader in
            Map(position: $position){
                ForEach(memories){ memory in
                    Marker(memory.title,coordinate: memory.coordinate)
                }
            }.onTapGesture(coordinateSpace: .local) { location in
                if let coordinate = reader.convert(location, from: .local){
                    let newMemory = Memory(title: "New Memory", coordinate: coordinate)
                    memories.append(newMemory)
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
