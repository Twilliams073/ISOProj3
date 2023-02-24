//
//  Album.swift
//  lab-tunley
//
//  Created by Tristan Williams on 2/23/23.
//

import Foundation

struct AlbumSearchResponse: Decodable {
    let results: [Album]
}

struct Album: Decodable {
    let poster_path: String
}
