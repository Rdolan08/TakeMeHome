
import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some View {
        VStack {
            Text("Dolan LocSpoof Demo")
                .font(.largeTitle)
                .padding()

            Map {
                Marker("Spoofed Location", coordinate: viewModel.region.center)
            }
            .frame(height: 300)
            .cornerRadius(10)
            .padding()

            Button(action: {
                viewModel.updateLocation(latitude: 45.11183700335066, longitude: -93.43851344737402)
            }) {
                Text("Go to Dolan Haus")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }.padding()

            Button(action: {
                viewModel.updateLocation(latitude: 44.9778, longitude: -93.2650)
            }) {
                Text("Go to Minneapolis")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }.padding()

            Button(action: {
                viewModel.updateLocation(latitude: 33.77593, longitude: -89.74198)
            }) {
                Text("Go to PresleyHAUS")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }.padding()

            Spacer()
        }
        .padding()
    }
}
