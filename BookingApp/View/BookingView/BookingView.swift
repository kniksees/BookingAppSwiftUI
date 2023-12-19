//
//  BookingView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct BookingView: View {
    var link: String
    @ObservedObject var bookingViewModel = BookingViewModel()
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
                    if bookingViewModel.bookingInfo != nil {
                        HotelBlockView(rating:  bookingViewModel.bookingInfo!.horating,
                                       ratingName: bookingViewModel.bookingInfo!.ratingName,
                                       hotelName: bookingViewModel.bookingInfo!.hotelName,
                                       hotelLocation: bookingViewModel.bookingInfo!.hotelAdress)
                        BookingInfoView(departure: bookingViewModel.bookingInfo!.departure,
                                        arrivalСountry:  bookingViewModel.bookingInfo!.arrivalCountry,
                                        tourDateStart:  bookingViewModel.bookingInfo!.tourDateStart,
                                        tourDateStop:  bookingViewModel.bookingInfo!.tourDateStop,
                                        numberOfNights:  bookingViewModel.bookingInfo!.numberOfNights,
                                        hotelName:  bookingViewModel.bookingInfo!.hotelName,
                                        room:  bookingViewModel.bookingInfo!.room,
                                        nutrition:  bookingViewModel.bookingInfo!.nutrition)
                        CustomerInfoBlockView(bookingViewModel: bookingViewModel)
                        ForEach(bookingViewModel.toorists, id: \.self) {toorist in
                            TooristInformationBlockVIew(tooristNumber: toorist.tooristNumberName, tooristId: toorist.tooristNumber, bookingViewModel: bookingViewModel)
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
                                    bookingViewModel.addTorist()
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
                        if bookingViewModel.bookingInfo != nil {
                            AmountBlockView(tourPrice: bookingViewModel.bookingInfo!.tourPrice,
                                            fuelCharge: bookingViewModel.bookingInfo!.fuelCharge,
                                            serviceCharge: bookingViewModel.bookingInfo!.serviceCharge,
                                            multiply: bookingViewModel.getCountOfPeople())
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
                    if bookingViewModel.isRadyForPay() {
                        NavigationLink(value: idLink(id: 4, link: "")) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 343, height: 48)
                                    .ignoresSafeArea()
                                    .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                if  bookingViewModel.bookingInfo != nil {
                                    Text("Опалтить \((bookingViewModel.bookingInfo!.tourPrice +  bookingViewModel.bookingInfo!.fuelCharge +  bookingViewModel.bookingInfo!.serviceCharge) * bookingViewModel.getCountOfPeople()) ₽")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16).weight(.medium))
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 35, trailing: 0))
                        }
                    } else {
                        Button(action: {
                            bookingViewModel.validateForPay()
                            print("aa")
                            print(bookingViewModel.contactInformationValidator)
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 343, height: 48)
                                    .ignoresSafeArea()
                                    .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                if  bookingViewModel.bookingInfo != nil {
                                    Text("Опалтить \((bookingViewModel.bookingInfo!.tourPrice +  bookingViewModel.bookingInfo!.fuelCharge +  bookingViewModel.bookingInfo!.serviceCharge) * bookingViewModel.getCountOfPeople()) ₽")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16).weight(.medium))
                                }
                                
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 35, trailing: 0))
                        })
                    }

                }
            }
        }.onAppear() {
            Task {
                await bookingViewModel.initBookingInfo(link: link)
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
