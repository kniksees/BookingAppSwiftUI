//
//  HotelRoom.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 18.12.2023.
//

import Foundation

struct HotelRoom: Identifiable {
    var uuid = UUID()
    var id: Int
    var name: String
    var price: Int
    var pricePer: String
    var peculiarities: [String]
    var imageUrls: [String]
    var imageData: [ImageIdentifible]
}
