//
//  ContentView.swift
//  CSQuote
//
//  Created by ODM on 7/20/20.
//  Copyright © 2020 ODM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            if networkManager.authorFeedback == "" && networkManager.quoteFeedback == "" {
                Text("Check your internet connection")
                    .font(.system(size: 30))
                    .padding()
            } else {
                
                VStack {
                    Text(networkManager.quoteFeedback)
                        //.font(.headline)
                        .font(.system(size: 30))
                        .padding()
                    Text("- \(networkManager.authorFeedback)")
                        //.font(.subheadline)
                        .font(.system(size: 20))
                        .padding()
                }
            }
        }
        .onTapGesture {
            self.networkManager.getData()
        }
            
        .onAppear{
            self.networkManager.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
