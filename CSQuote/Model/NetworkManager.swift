//
//  NetworkManager.swift
//  CSQuote
//
//  Created by ODM on 7/20/20.
//  Copyright © 2020 ODM. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var quoteFeedback = ""
    @Published var authorFeedback = ""
    
    func getData(){
        if let url = URL(string: "https://programming-quotes-api.herokuapp.com/quotes/random") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let csQuote = try decoder.decode(QuoteModel.self, from: safeData)
                            DispatchQueue.main.async {
                                self.quoteFeedback = csQuote.en
                                self.authorFeedback = csQuote.author
                            }
                        } catch {
                            print("from network manager \(error.localizedDescription)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
