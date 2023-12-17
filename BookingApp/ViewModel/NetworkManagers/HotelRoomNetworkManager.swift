//
//  HotelRoomNetworkManager.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import Foundation

class HotelRoomNetworkManager {
    
    static func getHotelRooms() async -> [Room] {
        let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(Welcome.self, from: data).rooms
    }
    
    static func getHotelRooms(link: String) async -> [Room] {
        let url = URL(string: link)!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(Welcome.self, from: data).rooms
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
        let rooms: [Room]
    }

    struct Room: Codable, Identifiable {
        let identificaror = UUID()
        let id: Int
        let name: String
        let price: Int
        let pricePer: String
        let peculiarities: [String]
        let imageUrls: [String]

        enum CodingKeys: String, CodingKey {
            case id, name, price
            case pricePer = "price_per"
            case peculiarities
            case imageUrls = "image_urls"
        }
    }
}
