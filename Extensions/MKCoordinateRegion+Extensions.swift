//
//  MKCoordinateRegion+Extensions.swift
//  MapsMaps
//
//  Created by 小平裕 on 2022/08/13.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static func defaultRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.4660694, longitude: 139.6226196), span:
                            MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        デフォルト地点は横浜。縮尺は0.01-0.025で調整
    }
    
    static func regionFromLandmark(_ landmark: Landmark) -> MKCoordinateRegion {
        MKCoordinateRegion(center: landmark.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
    }
    
}
