//
//  MapView.swift
//  MapsMaps
//
//  Created by jollyjoester on 2022/09/02.
//

import SwiftUI
import MapKit

struct MapView: View {
    // JSONから読み取ったSpotデータの配列
    @State private var spots: [Spot] = []
    // Mapの中心と表示領域
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.4660694,
            longitude: 139.6226196
        ),
        span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
    )
    // アラートの表示をコントロールするフラグ
    @State private var showingAlert = false
    @State private var alertTitle = ""
    
    // 画面表示
    var body: some View {
        NavigationView {
            // MapViewの準備。地図に表示するマーク(annotation)用のデータと一緒にセットする
            Map(coordinateRegion: $coordinateRegion, annotationItems: spots) { spot in
                // 1つのspotデータを元にannotattionの見た目の設定をしていく
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D( // Annotationの位置
                        latitude: spot.latitude,
                        longitude: spot.longitude
                                                      )
                ) {
                    VStack { // Annotationの見た目
                        Text(spot.name)
                            .font(.caption2)
                            .bold()
                        NavigationLink(destination: SampleSecondView(spot: spot)) {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title2)
                                .foregroundColor(.red)
                                .shadow(radius: 1)
                        }
                    }
                }
            }
            .ignoresSafeArea() // 時刻などが表示されてる部分にも地図を表示
            .navigationBarHidden(true) // ナビゲーションバーのタイトルを非表示にする
            .onAppear(perform: readJSON) // 画面が表示されるときにonAppearが呼ばれ、その際にreadJSONの処理を呼ぶ
        }
    }
    
    // JSONファイルの読み込み
    private func readJSON() {
        guard let url = Bundle.main.url(forResource: "spots", withExtension: "json") else {
            fatalError("spots.jsonがありません")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("ファイル読み込みに失敗しました")
        }
        
        let decoder = JSONDecoder()
        guard let spots = try? decoder.decode([Spot].self, from: data) else {
            fatalError("JSON読み込みに失敗しました")
        }
        
        self.spots = spots
    }
}

// JSONから読み込むための情報（今は最低限）
// JSONの項目と合わせる
struct Spot: Codable, Identifiable {
    var id: Int // Idnetifiableに適合しているとidというpropertyが必要
    let name: String
    let latitude: Double
    let longitude: Double
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
