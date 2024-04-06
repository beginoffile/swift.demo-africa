//
//  MapView.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 19/03/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
//    @State private var region: MKCoordinateRegion = {
//        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599 )
//        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
//        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
//        return mapRegion
//    }()
//    
//    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 30.0, longitudeDelta: 60.0)))
    
    @State private var regionPosition: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599 )
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        var cameraPosition = MapCameraPosition.region(mapRegion)
        
        return cameraPosition
        
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")

    
    //MARK: - BODY
    var body: some View {
        // MARK: - No1 BASIC MAP
        
       
        
        Map(position: $regionPosition){
            ForEach(locations) { location in
//                Annotation(location.name, coordinate: location.location){
//                    
//                }
//                Marker(location.name
//                   , coordinate: location.location)
//                    .tint(Color.orange)
                Annotation(location.name, coordinate: location.location){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            
               
            }
        }
        
        
        
        
        Text("MapView")
    }
}

#Preview {
    MapView()
}
