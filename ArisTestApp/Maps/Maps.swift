import SwiftUI
import MapKit
import CoreLocation

enum CustomMapStyle: String, CaseIterable, Identifiable {
    case drawing, photo, satelite, tagless
    var id: Self { self }
    
    var mapStyle: MapStyle {
        switch self {
        case .drawing:
            return .standard
        case .satelite:
            return .hybrid(elevation: .realistic, showsTraffic: true)
        case .photo:
            return .hybrid(showsTraffic: true)
        case .tagless:
            return .imagery
        }
    }
}

struct Maps: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.38597222, longitude: -8.40672222),
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    )
    
    @State private var style: CustomMapStyle = .photo
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom) {
                Map(position: $position).mapControls{
                    MapUserLocationButton()
                    MapPitchToggle()
                }
                .mapStyle(style.mapStyle)
                
                Picker("Map type", selection: $style) {
                    ForEach(CustomMapStyle.allCases) { mapType in
                        Text(mapType.rawValue.capitalized).tag(mapType)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color(UIColor.systemBackground).opacity(0.8))
                .cornerRadius(8)
                .padding()
            }
        }.onAppear{
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    Maps()
}
