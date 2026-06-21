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
    @State private var isShowingSheet: Bool = false;
    @State private var tempCoordinate: CLLocationCoordinate2D?
    @State private var newMemoryTitle: String = ""
    
    @State private var position: MapCameraPosition = .automatic;
    @State private var memories: [Memory] = [
        Memory(title: "Zaika", coordinate:CLLocationCoordinate2D(latitude: 28.4164, longitude: 77.0368))
    ]
    var body: some View {
        MapReader{ reader in
            Map(position: $position){
                ForEach(memories){ memory in
                    Marker(memory.title,coordinate: memory.coordinate)
                }
            }.onTapGesture(coordinateSpace: .local) { location in
                if let coordinate = reader.convert(location, from: .local){
                    tempCoordinate =  coordinate
                    newMemoryTitle = ""
                    isShowingSheet = true
                }
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $isShowingSheet){
            VStack(spacing: 20){
                Text("Name This Place").font(.headline)
                TextField("Eg: Great Coffee Shop", text: $newMemoryTitle)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                Button("Save Marker"){
                    if let coordinate = tempCoordinate{
                        let newMemory = Memory(title: newMemoryTitle, coordinate: coordinate)
                        memories.append(newMemory)
                        isShowingSheet = false
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(newMemoryTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                Spacer();
            }.padding(.top,30).presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView()
}
