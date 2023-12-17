//
//  AmountBlockView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct AmountBlockView: View {
    var tourPrice: Int
    var fuelCharge: Int
    var serviceCharge: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIScreen.main.bounds.size.width)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(.white)))
            VStack {
                HStack {
                    Text("Тур")
                        .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                    Spacer()
                    Text("\(tourPrice) ₽")
                        .foregroundStyle(Color(UIColor(.black)))
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))
                HStack {
                    Text("Топливный сбор")
                        .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                    Spacer()
                    Text("\(fuelCharge) ₽")
                        .foregroundStyle(Color(UIColor(.black)))
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                HStack {
                    Text("Сервисный сбор")
                        .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                    Spacer()
                    Text("\(serviceCharge) ₽")
                        .foregroundStyle(Color(UIColor(.black)))
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                HStack {
                    Text("К оплате")
                        .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                    Spacer()
                    Text("\(tourPrice + fuelCharge + serviceCharge) ₽")
                        .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 20, trailing: 0))
            }
            .font(.system(size: 16).weight(.regular))
            .frame(width: 343)
        }
    }
}
