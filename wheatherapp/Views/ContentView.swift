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
            if let location = locationManager.location{
                
                if let weather = weather{
                    Text("Weather Data Feched")
                    Text("Weather Data Feched")

                }else{
                    LoadingView()
                        .task {
                            do{
                             weather = try await
                                weatherManager.getCurrentWheather(latitude: location.latitude, longitude: location.longitude)
                                
                            }catch{
                                print("Error Getting\(error)")
                            }
                        }
                }
                Text("your coordinates are: \(location.latitude),\(location.longitude)")
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    WelcomView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.811, brightness: 0.34))
        .preferredColorScheme(.dark)
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
