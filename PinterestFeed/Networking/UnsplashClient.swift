//
//  UnsplashClient.swift
//  PinterestFeed
//
//  Created by Влад Третьяк on 10/9/18.
//  Copyright © 2018 Влад Третьяк. All rights reserved.
//

import Foundation

class UnsplashClient: APIClient {
    static let baseUrl = "https://api.unsplash.com"
    static let apiKey = "1e26d8234ea7af30210cea4fa87f6ce97494c7a1a9f70aeb5457eba9283e70bf"
    
    func fetch(with endpoint:UnsplashEndpoint, completion: @escaping (Either<Photos>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
}

