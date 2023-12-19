//
//  CustomHotelRoomIndexView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 19.12.2023.
//

import SwiftUI

struct CustomHotelRoomIndexView: View {
    @ObservedObject var hotelRoomsViewModel: HotelRoomsViewModel
    var id: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 15 * Double(hotelRoomsViewModel.rooms[id].imageData.count) + 12, height: 17)
                .foregroundStyle(Color(.white))
            HStack {
                let count = hotelRoomsViewModel.rooms[id].imageData.count
                ForEach(0..<count, id: \.self) { index in
                    if index == hotelRoomsViewModel.selectedTab[id] {
                        Circle()
                            .fill(.black)
                            .frame(width: 7, height: 7)
                    } else {
                        Circle()
                            .fill(.black)
                            .opacity((1 - (Double(abs(hotelRoomsViewModel.selectedTab[id] - index)) * (1.0 / Double(count)))) / 2)
                            .frame(width: 7, height: 7)
                    }
                }          
            }

        } .padding(EdgeInsets(top: 240, leading: 0, bottom: 0, trailing: 0))
    }
}
