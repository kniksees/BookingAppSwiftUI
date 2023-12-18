//
//  BookingInfo.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 18.12.2023.
//

import Foundation

struct BookingInfo: Identifiable {
    var uuid = UUID()
    var id: Int
    var hotelName, hotelAdress: String
    var horating: Int
    var ratingName, departure, arrivalCountry, tourDateStart: String
    var tourDateStop: String
    var numberOfNights: Int
    var room, nutrition: String
    var tourPrice, fuelCharge, serviceCharge: Int
}

struct TooristValidator: Hashable {
    var tooristNumber: Int
    var tooristNumberName: String
    var values = ["", "", "", "", "", ""]
    var validator = [true, true, true, true, true, true]
}
