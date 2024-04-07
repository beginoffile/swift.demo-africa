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
    @State var lat: Double = 0.0
    @State var lon: Double = 0.0

    
    //MARK: - BODY
    var body: some View {
        // MARK: - No1 BASIC MAP
        
       
        
        Map(position: $regionPosition){
            ForEach(locations) { location in

                
                // MARKER
//                Marker(location.name
//                   , coordinate: location.location)
//                    .tint(Color.orange)
                
                // BASIC ANNOTATION
//                Annotation(location.name, coordinate: location.location){
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 25, height: 25)
//                }
                
                //CUSTOM ADVANCED ANNOTATION
                Annotation(location.name, coordinate: location.location){
                    MapAnnotationView(location: location)
                }
            
               
            }
        }//:MAP

        .onMapCameraChange (frequency: .continuous){
            context in
                print("\(context.camera.centerCoordinate)")
            lat = context.camera.centerCoordinate.latitude
            lon = context.camera.centerCoordinate.longitude
            
            
        }
        .overlay(
            HStack(alignment: .center, spacing: 12){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
//                        Text("\(regionPosition.region!.center.latitude)")
//                            .font(.footnote)
//                            .foregroundColor(.white)
                        Text("\(lat)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }
                    Divider()
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
//                        Text("\(regionPosition.region!.center.longitude)")
//                            .font(.footnote)
//                            .foregroundColor(.white)
                        Text("\(lon)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }
                }
            }//: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            ,alignment: .topLeading
        
        )
    }
}

#Preview {
    MapView()
}
