//
//  Hotel.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 18.12.2023.
//

import Foundation

struct Hotel {
    var id = UUID()
    var identificator: Int
    var name: String
    var adress: String
    var minimalPrice: Int
    var priceForIt: String
    var rating: Int
    var ratingName: String
    var imageUrls: [String]
    var imageData: [ImageIdentifible]
    var description: String
    var peculiarities: [String]
}

