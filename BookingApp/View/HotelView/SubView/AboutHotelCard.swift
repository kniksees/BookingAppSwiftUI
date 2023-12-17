//
//  ButtonsCard.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 17.12.2023.
//

import SwiftUI
import TagLayoutView

struct ButtonsCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(red: 251 / 255, green: 251 / 255, blue: 252 / 255, alpha: 1)))
                .frame(width: 343, height: 184)
            VStack {
                Button(action: {}, label: {
                    HStack {
                        Image("ImageFace")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 15))
                        VStack {
                            HStack {
                                Text("Удобства")
                                    .foregroundStyle(Color(.black))
                                    .font(.system(size: 16).weight(.medium))
                                Spacer()
                            }
                            HStack {
                                Text("Самое необходимое")
                                    .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                                    .font(.system(size: 14).weight(.medium))
                                Spacer()
                            }
                        }
                        Image("ImageArrow")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 15))
                    }
                })
                Rectangle()
                    .frame(width: 275, height: 1)
                    .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 0.15)))
                    .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                Button(action: {}, label: {
                    HStack {
                        Image("ImageIncluded")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 15))
                        VStack {
                            HStack {
                                Text("Что включено")
                                    .foregroundStyle(Color(.black))
                                    .font(.system(size: 16).weight(.medium))
                                Spacer()
                            }
                            HStack {
                                Text("Самое необходимое")
                                    .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                                    .font(.system(size: 14).weight(.medium))
                                Spacer()
                            }
                        }
                        Image("ImageArrow")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 15))
                    }
                })
                Rectangle()
                    .frame(width: 275, height: 1)
                    .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 0.15)))
                    .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                Button(action: {}, label: {
                    HStack {
                        Image("ImageNotIncluded")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 15))
                        VStack {
                            HStack {
                                Text("Что не включено")
                                    .foregroundStyle(Color(.black))
                                    .font(.system(size: 16).weight(.medium))
                                Spacer()
                            }
                            HStack {
                                Text("Самое необходимое")
                                    .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                                    .font(.system(size: 14).weight(.medium))
                                Spacer()
                            }
                        }
                        Image("ImageArrow")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 15))
                    }
                })
            }
        }
        
    }
}


struct AboutHotelCard: View {
    var hotelInfo: HotelNetworkManager.Welcome?
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIScreen.main.bounds.size.width)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(.white)))
            VStack {
                HStack {
                    Text("Об Отеле")
                        .font(.system(size: 22).weight(.medium))
                    Spacer()
                }
                .padding(EdgeInsets(top: 20,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0))
                
                
                TagLayoutView(
                    hotelInfo?.aboutTheHotel.peculiarities ?? [],
                    tagFont: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin),
                    padding: 0,
                    parentWidth: 327) { tag in
                        Text(tag)
                            .font(.system(size: 15).weight(.medium))
                            .fixedSize()
                            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                            .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                            .background(Color(UIColor(red: 251 / 255, green: 251 / 255, blue: 251 / 255, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                
                
                Text(hotelInfo?.aboutTheHotel.description ?? "")
                    .font(.system(size: 16).weight(.regular))
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 8, trailing: 0))
                ButtonsCard()
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 18, trailing: 0))
                Spacer()
                
            }
            .frame(width: 343)
        }
    }
}
