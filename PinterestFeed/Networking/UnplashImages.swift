//
//  UnplashImages.swift
//  PinterestFeed
//
//  Created by Влад Третьяк on 10/8/18.
//  Copyright © 2018 Влад Третьяк. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

struct Photo: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let raw: URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
}

