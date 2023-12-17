//
//  HotelBlockView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct HotelBlockView: View {
    let rating: Int
    let ratingName: String
    let hotelName: String
    let hotelLocation: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIScreen.main.bounds.size.width)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(.white)))
            VStack {
                HStack {
                    RatingView(text: "★ \(rating) \(ratingName)")
                    Spacer()
                }
                .padding(EdgeInsets(top: 17, leading: 0, bottom: 0, trailing: 0))
                HStack {
                    Text(hotelName)
                        .font(.system(size: 22).weight(.medium))
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                HStack {
                    Text(hotelLocation)
                        .font(.system(size: 14))
                        .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
            }
            .frame(width: 343)
        }
    }
}
