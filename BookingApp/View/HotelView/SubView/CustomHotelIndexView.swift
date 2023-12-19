//
//  CustomIndexView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 19.12.2023.
//

import SwiftUI

struct CustomHotelIndexView: View {
    @ObservedObject var hotelViewModel: HotelViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 15 * Double(hotelViewModel.hotel!.imageData.count) + 12, height: 17)
                .foregroundStyle(Color(.white))
            HStack {
                if hotelViewModel.hotel != nil {
                    ForEach(0..<hotelViewModel.hotel!.imageData.count, id: \.self) { index in
                        if index == hotelViewModel.selectedTab {
                            Circle()
                                .fill(.black)
                                .frame(width: 7, height: 7)
                        } else {
                            Circle()
                                .fill(.black)
                                .opacity((1 - (Double(abs(hotelViewModel.selectedTab - index)) * (1.0 / Double(hotelViewModel.hotel!.imageData.count)))) / 2)
                                .frame(width: 7, height: 7)
                        }
                    }
                }
            }
        } .padding(EdgeInsets(top: 270, leading: 0, bottom: 0, trailing: 0))
    }
}

//struct CustomIndexView: View {
//    @State var numverOfPages: Int
//    @State var selectedPage: Int
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 5)
//                .frame(width: 15 * Double(numverOfPages) + 12, height: 17)
//                .foregroundStyle(Color(.white))
//            HStack {
//                
//                ForEach(0..<numverOfPages, id: \.self) { index in
//                    if index == selectedPage {
//                        Circle()
//                            .fill(.black)
//                            .frame(width: 7, height: 7)
//                    } else {
//                        Circle()
//                            .fill(.black)
//                            .opacity((1 - (Double(abs(selectedPage - index)) * (1.0 / Double(numverOfPages)))) / 2)
//                            .frame(width: 7, height: 7)
//                    }
//                }
//            }
//        } .padding(EdgeInsets(top: 270, leading: 0, bottom: 0, trailing: 0))
//    }
//}
