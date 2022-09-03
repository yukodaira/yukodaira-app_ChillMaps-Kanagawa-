//
//  SecondContentView.swift
//  MapsMaps
//
//  Created by 小平裕 on 2022/09/02.
//

import SwiftUI

var screenWidth = UIScreen.main.bounds.width

struct SecondContentView: View {
    var body: some View {
        VStack {
            Image("10000001_CafeTerrace樹ガーデン-00")
            
        ContentView().frame(width: screenWidth, height: screenWidth / 1.62)
        }
    }
}

struct SecondContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
