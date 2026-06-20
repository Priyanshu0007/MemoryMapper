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
        Map(position: $position){
            ForEach(memories){ memory in
                Marker(memory.title,coordinate: memory.coordinate)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
