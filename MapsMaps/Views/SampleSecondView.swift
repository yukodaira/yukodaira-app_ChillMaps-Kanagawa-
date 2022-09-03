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
        Text(spot.access)
        Text(spot.description)
        Text(spot.category)
        Text("\(spot.latitude)")
        Text("\(spot.longitude)")
    }
}

struct SampleSecondView_Previews: PreviewProvider {
    static var previews: some View {
        let spot = Spot(
            id: 0,
            name: "CafeTerrace樹ガーデン",
            imageURL: "https://dl.dropboxusercontent.com/s/oesvjeu4ujnu8ri/10000001_CafeTerrace%E6%A8%B9%E3%82%AC%E3%83%BC%E3%83%87%E3%83%B3-00.jpg",
            access: "JR鎌倉駅西口より鎌倉市役所方面に向かって徒歩で約18分",
            description:"市役所方面にトンネルを３つ超えた先、常盤の山の中に位置するカフェ「樹ガーデン」。入口から約170段近い階段を登った先には、遮るものもない広大な自然が眼下に広がる。山の斜面に備えられたテラス席は赤レンガで囲われており、古都鎌倉にいながら西欧の田園都市で過ごす感覚を味わう事が出来る。平日は比較的余裕があるが、新緑や紅葉の時期になると週末や休日はかなり混雑するため、開店直後がおすすめ。",
            category: "カフェ",
            latitude: 35.321216778386656,
            longitude: 139.5359551441773)
        SampleSecondView(spot: spot)
    }
}
