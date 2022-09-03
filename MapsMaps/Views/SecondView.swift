//
//  SecondView.swift
//  MapsMaps
//
//  Created by 小平裕 on 2022/09/03.
//

import SwiftUI

var screenwidth = UIScreen.main.bounds.width

struct SecondView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image("CafeTerrace樹ガーデン").resizable().frame(width: screenwidth, height: screenwidth / 1.62)

                    Text("CafeTerrace樹ガーデン")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .background(Color.black.opacity(0.3))
                }
                
                VStack(spacing: 30) {

                    HStack(alignment: .firstTextBaseline, spacing: 20) {
                        Text("カテゴリ")
                        Text("カフェ")
                    }
                    
                    HStack(alignment: .firstTextBaseline, spacing: 20) {
                        Text("アクセス")
                        Text("JR鎌倉駅西口より鎌倉市役所方面に向かって徒歩で約18分")
                    }
                    
                    HStack(alignment: .firstTextBaseline, spacing: 20) {
                        Text("見どころ")
                        Text("市役所方面にトンネルを３つ超えた先、常盤の山の中に位置するカフェ「樹ガーデン」。入口から約170段近い階段を登った先には、遮るものもない広大な自然が眼下に広がる。山の斜面に備えられたテラス席は赤レンガで囲われており、古都鎌倉にいながら西欧の田園都市で過ごす感覚を味わう事が出来る。平日は比較的余裕があるが、新緑や紅葉の時期になると週末や休日はかなり混雑するため、開店直後がおすすめ。")
                    }
                }
        }
                        
            MapView().frame(width: screenwidth, height: screenwidth / 1.62)
            
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
