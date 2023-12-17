//
//  HotelView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 15.12.2023.
//

import SwiftUI

struct idLink: Hashable {
    static func == (lhs: idLink, rhs: idLink) -> Bool {
        lhs.id == rhs.id
    }
    var id: Int
    var link: String
}

struct HotelView: View {
    @State var hotelInfo: HotelNetworkManager.Welcome? = nil
    @State var image: Data? = nil
    @State var path = [idLink]()

    var body: some View {
    
        
        NavigationStack(path: $path) {
            
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .ignoresSafeArea()
                    .foregroundStyle(Color(UIColor(red: 246 / 255, green: 246 / 255, blue: 249 / 255, alpha: 1)))
                VStack {
                    Spacer(minLength: 40)
                    ScrollView {
                        MainCard(hotelInfo: hotelInfo, image: image)
                        AboutHotelCard(hotelInfo: hotelInfo)
                        Spacer(minLength: 105)
                    }
                }
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.size.width, height: 90)
                            .ignoresSafeArea()
                            .foregroundStyle(Color(UIColor(.white)))
                        Text("Отель")
                            .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                            .font(.system(size: 18).weight(.medium))
                    }
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.size.width, height: 90)
                            .ignoresSafeArea()
                            .foregroundStyle(Color(UIColor(.white)))
                        NavigationLink(value: idLink(id: 2, link: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195")) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 343, height: 48)
                                    .ignoresSafeArea()
                                    .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                Text("К выбору номер")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16).weight(.medium))
                                
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        }
                        .navigationDestination(for: idLink.self) { pathValue in
                            if pathValue == idLink(id: 2, link: "") {
                                HotelRoomView(hotelName: hotelInfo?.name ?? "", link: pathValue.link, path: $path)
                                    .toolbarRole(.editor)
                            } else if pathValue == idLink(id: 3, link: "") {
                                BookingView(link: pathValue.link , path: $path)
                                    .toolbarRole(.editor)
                            } else if pathValue == idLink(id: 4, link: "") {
                                PaidView(path: $path)
                                    .toolbarRole(.editor)
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar)
            
        }
        .accentColor(.black)
        .preferredColorScheme(.light)
        .onAppear {
            Task {
                //hotelInfo = await HotelNetworkManager.getHotel()
                hotelInfo = await HotelNetworkManager.getHotel(link: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473")
                image = await HotelNetworkManager.getDataByURL(apiURL: hotelInfo?.imageUrls[0])
            }
        }
    }
}

#Preview {
    HotelView()
}
