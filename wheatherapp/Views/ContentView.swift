//
//  ContentView.swift
//  wheatherapp
//
//  Created by Dilip Kumar on 10/08/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WheatherManager()
    
    @State var weather: ResponseBody?
    
    var body: some View {
        
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWheather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
