//
//  SplashView.swift
//  Orchid
//
//  Created by Danh Truong on 3/11/21.
//

import SwiftUI

struct SplashView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                
                Text("Hello, Splash!")
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var hike = HikeModelView().hikes[0]
    static var previews: some View {
        SplashView(hike: hike)
    }
}
