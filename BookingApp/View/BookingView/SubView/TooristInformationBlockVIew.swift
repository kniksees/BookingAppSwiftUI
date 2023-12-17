//
//  TooristInformationBlockVIew.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct TooristInformationBlockVIew: View {
    var tooristNumber: String
    @State var toogle = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIScreen.main.bounds.size.width)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(.white)))
            VStack {
                if toogle {
                    VStack {
                        HStack {
                            Text(tooristNumber)
                                .font(.system(size: 22).weight(.medium))
                            Spacer()
                            Button(action: {
                                toogle.toggle()
                            }, label: {
                                ZStack {
                                    Image("ImageArrowBlue")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .rotationEffect(.degrees(-90))
                                        
                                    
                                    RoundedRectangle(cornerRadius: 6)
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 0.1)))
                                }
                            })
                        }
                        CustomTextField(placeHolder: "Имя")
                        CustomTextField(placeHolder: "Фамилия")
                        CustomTextField(placeHolder: "Дата рождения")
                        CustomTextField(placeHolder: "Гражданство")
                        CustomTextField(placeHolder: "Номер загранпаспорта")
                        CustomTextField(placeHolder: "Срок действия загранпаспорта")
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                } else {
                    HStack {
                        Text(tooristNumber)
                            .font(.system(size: 22).weight(.medium))
                        Spacer()
                        Button(action: {
                            toogle.toggle()
                        }, label: {
                            ZStack {
                                Image("ImageArrowBlue")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .rotationEffect(.degrees(90))
                                    
                                
                                RoundedRectangle(cornerRadius: 6)
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(Color(UIColor(red: 13 / 255, green: 114 / 255, blue: 255 / 255, alpha: 0.1)))
                            }
                        })

                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
            }
            .frame(width: 343)
        }
    }
}
