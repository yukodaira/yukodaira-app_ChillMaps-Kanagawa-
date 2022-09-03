//
//  SampleSecondView.swift
//  MapsMaps
//
//  Created by jollyjoester on 2022/09/02.
//

import SwiftUI

struct SampleSecondView: View {
    
    let spot: Spot
    
    var body: some View {
        Text(spot.name)
    }
}

struct SampleSecondView_Previews: PreviewProvider {
    static var previews: some View {
        let spot = Spot(
            id: 0,
            name: "CafeTerrace樹ガーデン",
            latitude: 35.321216778386656,
            longitude: 139.5359551441773)
        SampleSecondView(spot: spot)
    }
}
