//
//  PaidView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct PaidView: View {
    @Binding var path: [idLink]
    var body: some View {
        
        
        
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                .ignoresSafeArea()
                .foregroundStyle(Color(.white))
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 47)
                        .frame(width: 94, height: 94)
                        .foregroundStyle(Color(UIColor(red: 246 / 255, green: 246 / 255, blue: 249 / 255, alpha: 1)))
                    Image("ImagePaid")
                        .resizable()
                        .frame(width: 44, height: 44)
                }
                
                Text("Ваш заказ принят в работу")
                    .font(.system(size: 22).weight(.medium))
                    .foregroundStyle(.black)
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .font(.system(size: 16).weight(.regular))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
            }
            .frame(width: 343)
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width, height: 90)
                        .ignoresSafeArea()
                        .foregroundStyle(Color(UIColor(.white)))
                    Text("Заказ оплачен")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        .font(.system(size: 18).weight(.medium))
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width, height: 110)
                        .ignoresSafeArea()
                        .foregroundStyle(Color(UIColor(.white)))
                    Button(action: {
                        path.removeAll()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 343, height: 48)
                                .ignoresSafeArea()
                                .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 1)))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            Text("Супер!")
                                .foregroundStyle(.white)
                                .font(.system(size: 16).weight(.medium))
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 35, trailing: 0))
                    })
                }
                
                
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

