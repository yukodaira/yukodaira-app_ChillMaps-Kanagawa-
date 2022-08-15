//
//  ContentView.swift
//  MapsMaps
//
//  Created by jollyjoester on 2022/08/15.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @EnvironmentObject var localSearchService: LocalSearchService
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            
            TextField("検索", text: $search)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    localSearchService.search(query: search)
                }.padding()
            
            if localSearchService.landmarks.isEmpty {
                Text("あなただけの聖域を見つけに行こう。")
                    .padding()
                    .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(.green, lineWidth: 2)
                        )
            } else {
                LandmarkListView()
            }
            
            Map(coordinateRegion: $localSearchService.region, showsUserLocation: true, annotationItems: localSearchService.landmarks) { landmark in
                
                MapAnnotation(coordinate: landmark.coordinate) {
                    Text("ChillSpot")
                    Image(systemName: "Chillspot")
                        .foregroundColor(localSearchService.landmark == landmark ? .purple: .red)
                        .scaleEffect(localSearchService.landmark == landmark ? 2: 1)
                }
                
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocalSearchService())
    }
}
