//
//  MainCard.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 17.12.2023.
//

import SwiftUI

struct MainCard: View {
    var hotelInfo: Hotel
    var images: [ImageIdentifible]
    @ObservedObject var hotelViewModel: HotelViewModel
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIScreen.main.bounds.size.width)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(.white)))
            VStack {
                TabView(selection: $hotelViewModel.selectedTab) {
                    ForEach(0..<images.count, id: \.self) { i in
                        if let image = UIImage(data: images[i].data) {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 343, height: 257)
                                .cornerRadius(15)
                                .padding(EdgeInsets(top: 20,
                                                    leading: 0,
                                                    bottom: 5,
                                                    trailing: 0))
                        }
                    }
                }
                .frame(width: 343, height: 280)
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                .overlay(CustomHotelIndexView(hotelViewModel: hotelViewModel))
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                HStack {
                    RatingView(text: "★ \(hotelInfo.rating) \(hotelInfo.ratingName)")
                    Spacer()
                }
                .frame(width: 343)
                .padding(EdgeInsets(top: 5,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0))
                
                HStack {
                    Text(hotelInfo.name)
                        .font(.system(size: 22).weight(.medium))
                    Spacer()
                }
                .frame(width: 343)
                .padding(EdgeInsets(top: 0,
                                    leading: 0,
                                    bottom: 2,
                                    trailing: 0))
                
                HStack {
                    Text(hotelInfo.adress)
                        .font(.system(size: 14))
                        .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                    Spacer()
                }
                .frame(width: 343)
                .padding(EdgeInsets(top: 0,
                                    leading: 0,
                                    bottom: 2,
                                    trailing: 0))
                
                HStack {
                    Text("от \(hotelInfo.minimalPrice) ₽")
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                    Text(hotelInfo.priceForIt.lowercased())
                        .font(.system(size: 16).weight(.regular))
                        .padding(EdgeInsets(top: 8,
                                            leading: 0,
                                            bottom: 0,
                                            trailing: 0))
                        .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 0,
                                    leading: 0,
                                    bottom: 15,
                                    trailing: 0))
                .frame(width: 343)
            }
        }
    }
}
