//
//  LocalSearchService.swift
//  MapsMaps
//
//  Created by 小平裕 on 2022/08/11.
//

import Foundation
import MapKit
import Combine

class LocalSearchService: ObservableObject {
//    ObservableObjectに準拠したオブジェクトをSwiftUIから監視対象とする方法(3つ)
//    親View からインスタンスを受け取る
    
    @Published var region: MKCoordinateRegion = MKCoordinateRegion.defaultRegion()
    let locationManager = LocationManager()
    var cancellables = Set<AnyCancellable>()
    @Published var landmarks: [Landmark] = []
    @Published var landmark: Landmark?
    
    init() {
        locationManager.$region.assign(to: \.region, on: self)
            .store(in: &cancellables)
    }
    
    func search(query: String) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = locationManager.region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
                
            }
        }
        
        
    }
}
