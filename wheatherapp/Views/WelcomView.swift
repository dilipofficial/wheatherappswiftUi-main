//
//  WelcomView.swift
//  wheatherapp
//
//  Created by dilipkumar on 26/08/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {

        VStack{
            VStack(spacing: 20){
                Text("Welcome to Wheather App")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Please share your current location to get the wheather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(10)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        

    }
}

struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
    }
}
