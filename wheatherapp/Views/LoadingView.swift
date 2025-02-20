//
//  LoadingView.swift
//  wheatherapp
//
//  Created by dilipkumar on 26/08/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
