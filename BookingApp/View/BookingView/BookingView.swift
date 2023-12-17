//
//  BookingView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct BookingView: View {
    var link: String
    
    @State var countOfToorist = 1
    @State var bookingInfo: BookingNetworkManager.Welcome? = nil
    @State var toorists = ["Первый турист", "Второй турсит"]
    var tooristsLabels = ["Первый турист", "Второй турсит", "Третий турсит", "Четвертый турсит", "Пятый турсит",
                          "Шестой турсит", "Седьмой турсит", "Восьмой турсит", "Девятый турсит", "Десятый турсит"]
    @Binding var path: [idLink]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(red: 246 / 255, green: 246 / 255, blue: 249 / 255, alpha: 1)))
            VStack {
                
                ScrollView {
                    Spacer(minLength: 90)
                    if bookingInfo != nil {
                        HotelBlockView(rating: bookingInfo!.horating,
                                       ratingName: bookingInfo!.ratingName,
                                       hotelName: bookingInfo!.hotelName,
                                       hotelLocation: bookingInfo!.hotelAdress)
                        BookingInfoView(departure: bookingInfo!.departure,
                                        arrivalСountry:  bookingInfo!.arrivalCountry,
                                        tourDateStart:  bookingInfo!.tourDateStart,
                                        tourDateStop:  bookingInfo!.tourDateStop,
                                        numberOfNights:  bookingInfo!.numberOfNights,
                                        hotelName:  bookingInfo!.hotelName,
                                        room:  bookingInfo!.room,
                                        nutrition:  bookingInfo!.nutrition)
                        CustomerInfoBlockView()
                        ForEach(toorists, id: \.self) {toorist in
                            TooristInformationBlockVIew(tooristNumber: toorist)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: UIScreen.main.bounds.size.width)
                                .ignoresSafeArea()
                                .foregroundStyle(Color(UIColor(.white)))
                            HStack {
                                Text("Добавить туриста")
                                    .font(.system(size: 22).weight(.medium))
                                Spacer()
                                Button(action: {
                                    if toorists.count < tooristsLabels.count {
                                        toorists.append(tooristsLabels[toorists.count])
                                    } else {
                                        toorists.append("Турист \(toorists.count)")
                                    }
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 6)
                                            .frame(width: 32, height: 32)
                                            .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                                        Image(systemName: "plus")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                            .foregroundStyle(Color(.white))
                                    }
                                })
                            }
                            .frame(width: 343)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        }
                        if bookingInfo != nil {
                            AmountBlockView(tourPrice: bookingInfo!.tourPrice,
                                            fuelCharge: bookingInfo!.fuelCharge,
                                            serviceCharge: bookingInfo!.serviceCharge)
                        }
                        
                        
                    }
                    Spacer(minLength: 120)
                }
            }
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width, height: 100)
                        .ignoresSafeArea()
                        .foregroundStyle(Color(UIColor(.white)))
                    Text("Бронирование")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        .font(.system(size: 18).weight(.medium))
                        .multilineTextAlignment(.center)
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width, height: 110)
                        .ignoresSafeArea()
                        .foregroundStyle(Color(UIColor(.white)))
                    NavigationLink(value: 4) {
                        NavigationLink {
                            PaidView(path: $path)
                                .toolbarRole(.editor)
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 343, height: 48)
                                    .ignoresSafeArea()
                                    .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                if bookingInfo != nil {
                                    Text("Опалтить \(bookingInfo!.tourPrice + bookingInfo!.fuelCharge + bookingInfo!.serviceCharge) ₽")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16).weight(.medium))
                                }
                                
                                
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 35, trailing: 0))
                        }
                    }
                }
            }
        }.onAppear() {
            Task {
                bookingInfo = await BookingNetworkManager.getHotelRooms(link: link)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar) 
    }
}


#Preview {
    struct Preview: View {
        @State var path = [idLink]()
        var body: some View {
            BookingView(link: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff", path: $path)
        }
    }
    return Preview()
}
