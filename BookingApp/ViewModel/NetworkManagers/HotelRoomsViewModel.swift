//
//  HotelRoomNetworkManager.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import Foundation

class HotelRoomsViewModel: ObservableObject {
    
    @Published var rooms = [HotelRoom]()
    
    func initHotelRooms(link: String) {
        if rooms.isEmpty {
            Task {
                let roomsInfo = await getHotelRooms(link: link)
                await MainActor.run {
                    for i in roomsInfo {
                        rooms.append(HotelRoom(id: i.id,
                                               name: i.name,
                                               price: i.price,
                                               pricePer: i.pricePer,
                                               peculiarities: i.peculiarities,
                                               imageUrls: i.imageUrls,
                                               imageData: []))
                    }
                }
                
                for i in 0..<rooms.count {
                    for link in rooms[i].imageUrls {
                        if let data = await getDataByURL(apiURL: link) {
                            await MainActor.run {
                                rooms[i].imageData.append(ImageIdentifible(data: data))
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getHotelRooms(link: String) async -> [Room] {
        guard let url = URL(string: link) else {
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try! JSONDecoder().decode(Welcome.self, from: data).rooms
        } catch {
            return []
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
