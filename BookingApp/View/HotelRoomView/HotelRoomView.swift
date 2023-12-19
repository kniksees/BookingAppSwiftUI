//
//  HotelRoomView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct HotelRoomView: View {
    var hotelName: String
    var link: String
    @ObservedObject var hotelRoomsViewModel = HotelRoomsViewModel()
    @Binding var path: [idLink]
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(red: 246 / 255, green: 246 / 255, blue: 249 / 255, alpha: 1)))
            VStack {
                ScrollView {
                    Spacer(minLength: 75)
                    if hotelRoomsViewModel.rooms.count <= hotelRoomsViewModel.selectedTab.count {
                        ForEach(hotelRoomsViewModel.rooms) { room in
                            HotelRoomCard(path: $path, hotelRoomsViewModel: hotelRoomsViewModel, id: room.id - 1)
                        }
                    }
                    Spacer(minLength: 105)
                }
            }
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width, height: 100)
                        .ignoresSafeArea()
                        .foregroundStyle(Color(UIColor(.white)))
                    Text(hotelName)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        .font(.system(size: 18).weight(.medium))
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
        }
        .onAppear {
            Task {
                hotelRoomsViewModel.initHotelRooms(link: link)
            }
            
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}


#Preview {
    struct Preview: View {
        @State var path = [idLink]()
        var body: some View {
            HotelRoomView(hotelName: "Hotel", link: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195", path: $path)
            //HotelRoomView(hotelName: "Hotel", link: "https://run.mocky.io/v3/634ae004-6fa0-49eb-833f-7da7a358a636", path: $path)
           
        }
    }
    return Preview()
}
