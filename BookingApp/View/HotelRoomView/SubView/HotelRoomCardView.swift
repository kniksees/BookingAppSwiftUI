//
//  HotelRoomCardView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 17.12.2023.
//

import SwiftUI
import TagLayoutView



struct HotelRoomCard: View {
    var room: HotelRoom
    @Binding var path: [idLink]

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: UIScreen.main.bounds.size.width)
                    .ignoresSafeArea()
                    .foregroundStyle(Color(UIColor(.white)))
                VStack {
                        TabView {
                            ForEach(room.imageData) { image in
                                if let image = UIImage(data: image.data) {
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
                        .tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                  
         


                    HStack {
                        HStack {
                            Text(room.name)
                                .font(.system(size: 22).weight(.medium))
                            Spacer()
                        }
                        .frame(width: 343)
                        .padding(EdgeInsets(top: 0,
                                            leading: 0,
                                            bottom: 2,
                                            trailing: 0))
                        Spacer(minLength: 0)
                    }
                    
                    TagLayoutView(
                        room.peculiarities ,
                        tagFont: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin),
                        padding: 0,
                        parentWidth: 250) { tag in
                            Text(tag)
                                .font(.system(size: 15).weight(.medium))
                                .fixedSize()
                                .padding(EdgeInsets(top: 7, leading: 12, bottom: 7, trailing: 12))
                                .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                                .background(Color(UIColor(red: 251 / 255, green: 251 / 255, blue: 251 / 255, alpha: 1)))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    
                    
                    Button(action: {}, label: {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 192, height: 34)
                                    .ignoresSafeArea()
                                    .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 0.1)))
                                HStack {
                                    
                                    Text("Подробнее о номере ")
                                        .font(.system(size: 15).weight(.medium))
                                        .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                                    
                                    Image("ImageArrowBlue")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 0))
                                    
                                    
                                }
                                .frame(width: 192)
                            }
                            
                            Spacer()
                        }
                    })
                    HStack {
                        Text("\(room.price) ₽")
                            .font(.system(size: 30).weight(.semibold))
                        Text(room.pricePer)
                            .font(.system(size: 16).weight(.regular))
                            .padding(EdgeInsets(top: 8,
                                                leading: 0,
                                                bottom: 0,
                                                trailing: 0))
                            .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                        Spacer(minLength: 0)
                        
                        
                    }
                    NavigationLink(value: idLink(id: 3, link: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff")) {
                        ZStack {
                            Rectangle()
                                .frame(width: 343, height: 48)
                                .ignoresSafeArea()
                                .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            Text("Выбрать номер")
                                .foregroundStyle(.white)
                                .font(.system(size: 16).weight(.medium))
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    }
                }
                .frame(width: 343)
            }
            
        }
    }
}
