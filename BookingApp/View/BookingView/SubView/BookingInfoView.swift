//
//  BookingInfoView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import Foundation

import SwiftUI

struct LineVew: View {
    var label: String
    var text: String
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text(label)
                        .font(.system(size: 16).weight(.regular))
                        .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                    Spacer(minLength: 0)
                    
                }
                .frame(width: 120)
            }
            VStack {
                HStack {
                    Text(text)
                        .font(.system(size: 16).weight(.regular))
                        .foregroundStyle(Color(.black))
                        .lineLimit(2)
                    Spacer(minLength: 0)
                }
            }
        }
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
    }
}

struct BookingInfoView: View {
    let departure: String
    let arrivalСountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let hotelName: String
    let room: String
    let nutrition: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIScreen.main.bounds.size.width)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(.white)))
            VStack {
                LineVew(label: "Вылет из", text: departure)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                LineVew(label: "Страна, город", text: arrivalСountry)
                LineVew(label: "Даты", text: "\(tourDateStart) - \(tourDateStop)")
                LineVew(label: "Кол-во ночей", text: "\(numberOfNights) ночей")
                LineVew(label: "Отель", text: hotelName)
                LineVew(label: "Номер", text: room)
                LineVew(label: "Питание", text: nutrition)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .frame(width: 343)
        }
    }
}


//struct BookingInfoView: View {
//    let departure: String
//    let arrivalСountry: String
//    let tourDateStart: String
//    let tourDateStop: String
//    let numberOfNights: Int
//    let hotelName: String
//    let room: String
//    let nutrition: String
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 16)
//                .frame(width: UIScreen.main.bounds.size.width)
//                .ignoresSafeArea()
//                .foregroundStyle(Color(UIColor(.white)))
//            VStack {
//                
//
//            }
//            .frame(width: 343)
//        }
//    }
//}
