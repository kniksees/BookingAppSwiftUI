//
//  CustomerInfoBlockView.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct CustomTextField: View {
    var placeHolder: String
    @State var text = ""
    @State var isTapped = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color(UIColor(red: 246 / 255, green: 246 / 255, blue: 249 / 255, alpha: 1)))
                .frame(width: 343, height: 52)
            TextField("", text: $text) {status in
                if status {
                    withAnimation(.easeOut) {
                        isTapped = true
                    }
                }
            } onCommit: {
                if text == "" {
                    withAnimation(.easeOut) {
                        isTapped = false
                    }
                }
            }
            .padding(EdgeInsets(top: isTapped ? 15 : 0, leading: 0, bottom: 0, trailing: 0))
            .background(
                Text(placeHolder)
                    .scaleEffect(isTapped ? 0.75 : 1)
                    .foregroundStyle(Color(UIColor(red: 169 / 255, green: 171 / 255, blue: 183 / 255, alpha: 1)))
                    .offset(x: isTapped ? -Double(placeHolder.count) * 1.2 : 0, y: isTapped ? -15 : 0)
                , alignment: .leading)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0))
        }
    }
}

struct CustomerInfoBlockView: View {
    @State var telephoneNumber = ""
    @State var email = ""
    @State var isTapped = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIScreen.main.bounds.size.width)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(.white)))
            VStack {
                
                HStack {
                    Text("Информация о покупателе")
                        .font(.system(size: 22).weight(.medium))
                    Spacer()
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                
                CustomTextField(placeHolder: "Номер телефона")
                CustomTextField(placeHolder: "Почта")
                
                HStack {
                    Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                        .font(.system(size: 14).weight(.regular))
                        .foregroundStyle(Color(UIColor(red: 130 / 255, green: 135 / 255, blue: 150 / 255, alpha: 1)))
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
            }
            .frame(width: 343)
        }
    }
}
