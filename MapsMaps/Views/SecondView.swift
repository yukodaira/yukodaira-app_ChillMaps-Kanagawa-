//
//  SecondView.swift
//  MapsMaps
//
//  Created by 小平裕 on 2022/09/03.
//

import SwiftUI

var screenwidth = UIScreen.main.bounds.width

struct SecondView: View {
    
    let spot: Spot
//    lazy var imageUrl = URL(string: spot.imageURL)
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    //                  Image("CafeTerrace樹ガーデン").resizable().frame(width: screenwidth, height: screenwidth / 1.62)
                    
                    
                    AsyncImage(url: URL(string: spot.imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 240, height: 126)
                }
                
                Text(spot.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.pink)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .firstTextBaseline, spacing: 10) {
                    Text("カテゴリ")
                    .background(Color.green.opacity(0.3))
                    Text(spot.category)
                }
                
                HStack(alignment: .firstTextBaseline, spacing: 10) {
                    Text("アクセス")
                        .background(Color.green.opacity(0.3))
                    Text(spot.access)
                }
                
                HStack(alignment: .firstTextBaseline, spacing: 10) {
                    Text("見どころ")
                        .background(Color.green.opacity(0.3))
                    Text(spot.description)
                }
            }
        }
        
        MapView().frame(width: screenwidth, height: screenwidth / 2.5)
        
    }
}

struct SecondView_Previews: PreviewProvider {
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
        SecondView(spot: spot)
        
    }
}
