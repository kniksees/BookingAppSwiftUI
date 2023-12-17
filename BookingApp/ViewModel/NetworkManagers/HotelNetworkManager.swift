//
//  HotelNetworkManager.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 15.12.2023.
//

import Foundation

class HotelNetworkManager {
    
    static func getHotel() async -> Welcome {
        let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(Welcome.self, from: data)
    }
    
    static func getHotel(link: String) async -> Welcome {
        let url = URL(string: link)!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(Welcome.self, from: data)
    }
    
    static func getDataByURL(apiURL: String?) async -> Data? {
        guard let apiURL else {
            return nil
        }
        let url = URL(string: apiURL)!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return data
    }
    
    struct Welcome: Codable {
        let id: Int
        let name, adress: String
        let minimalPrice: Int
        let priceForIt: String
        let rating: Int
        let ratingName: String
        let imageUrls: [String]
        let aboutTheHotel: AboutTheHotel

        enum CodingKeys: String, CodingKey {
            case id, name, adress
            case minimalPrice = "minimal_price"
            case priceForIt = "price_for_it"
            case rating
            case ratingName = "rating_name"
            case imageUrls = "image_urls"
            case aboutTheHotel = "about_the_hotel"
        }
    }

    struct AboutTheHotel: Codable {
        let description: String
        let peculiarities: [String]
    }

}

