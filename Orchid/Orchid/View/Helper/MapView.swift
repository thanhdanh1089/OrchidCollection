//
//  MapView.swift
//  Orchid
//
//  Created by Shinhan DS on 3/16/21.
//

import SwiftUI
import MapKit

struct Point: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @EnvironmentObject var model: HouseGardenModelView
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [Point(coordinate: coordinate)]) { point in
            MapPin(coordinate: point.coordinate, tint: .green)
        }.onAppear {
            setRegion(coordinate)
        }
    }
    
    func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
