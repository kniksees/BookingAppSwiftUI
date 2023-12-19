//
//  HotelNetworkManager.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 15.12.2023.
//

import Foundation

class HotelViewModel: ObservableObject {
    
    @Published var hotel: Hotel? = nil
    
    func initHotel(link: String) async {
        Task {
            guard let hotelInfo = await getHotel(link: link) else {
                print("hotel not found")
                return
            }
            await MainActor.run {
                hotel = Hotel(identificator: hotelInfo.id,
                              name: hotelInfo.name,
                              adress: hotelInfo.adress,
                              minimalPrice: hotelInfo.minimalPrice,
                              priceForIt: hotelInfo.priceForIt,
                              rating: hotelInfo.rating,
                              ratingName: hotelInfo.ratingName,
                              imageUrls: hotelInfo.imageUrls,
                              imageData: [],
                              description: hotelInfo.aboutTheHotel.description,
                              peculiarities: hotelInfo.aboutTheHotel.peculiarities)
            }
           

            for i in hotelInfo.imageUrls {
                if let data = await getDataByURL(apiURL: i)  {
                    if hotel != nil {
                        await MainActor.run {
                            hotel!.imageData.append(ImageIdentifible(data: data))
                        }
                    }
                }
            }
        }
    }
    
    func getHotel(link: String) async -> Welcome? {
        guard let url = URL(string: link) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                return try JSONDecoder().decode(Welcome.self, from: data)
            } 
        } catch {
            return nil
        }

    }
    
    func getDataByURL(apiURL: String?) async -> Data? {
        guard let apiURL else {
            return nil
        }
        guard let url = URL(string: apiURL) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            return nil
        }
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

    @Published var selectedTab = 0
}

