//
//  TooristInformationBlockVIew.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct CustomTextFieldWithId: View {
    var placeHolder: String
    @State var text = ""
    @State var isTapped = false
    @ObservedObject var bookingViewModel: BookingViewModel
    @State var isValid = true
    var validator: (Int, String) -> Bool
    var id: Int
    var fieldType: Int
    
    var body: some View {
        ZStack {
            if isValid {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor(red: 246 / 255, green: 246 / 255, blue: 249 / 255, alpha: 1)))
                    .frame(width: 343, height: 52)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor(red: 235 / 255, green: 87 / 255, blue: 87 / 255, alpha: 0.15)))
                    .frame(width: 343, height: 52)
            }
            TextField("", text: $text) {status in
                if status {
                    withAnimation(.easeOut) {
                        isTapped = true
                    }
                }
            } onCommit: {
                isValid = validator(id, text)
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
        .onAppear() {
            text = bookingViewModel.toorists[id].values[fieldType]
            isValid = validator(id, text)
            if !text.isEmpty {
                isTapped = true
            }
        }
    }
}


struct TooristInformationBlockVIew: View {
    var tooristNumber: String
    var tooristId: Int
    //@State var toogle = false
    @ObservedObject var bookingViewModel: BookingViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIScreen.main.bounds.size.width)
                .ignoresSafeArea()
                .foregroundStyle(Color(UIColor(.white)))
            VStack {
                if bookingViewModel.toggle[tooristId] {
                    VStack {
                        HStack {
                            Text(tooristNumber)
                                .font(.system(size: 22).weight(.medium))
                            Spacer()
                            Button(action: {
                                bookingViewModel.toggle[tooristId].toggle()
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
                        CustomTextFieldWithId(placeHolder: "Имя",
                                              bookingViewModel: bookingViewModel,
                                              validator: bookingViewModel.checkFirstName(id:name:),
                                              id: tooristId,
                                              fieldType: 0)
                        CustomTextFieldWithId(placeHolder: "Фамилия",
                                              bookingViewModel: bookingViewModel,
                                              validator: bookingViewModel.checkSurname(id:surname:),
                                              id: tooristId,
                                              fieldType: 1)
                        CustomTextFieldWithId(placeHolder: "Дата рождения",
                                              bookingViewModel: bookingViewModel,
                                              validator: bookingViewModel.checkBirthday(id:birthday:),
                                              id: tooristId,
                                              fieldType: 2)
                        CustomTextFieldWithId(placeHolder: "Гражданство",
                                              bookingViewModel: bookingViewModel,
                                              validator: bookingViewModel.checkСitizenship(id:citizenship:),
                                              id: tooristId,
                                              fieldType: 3)
                        CustomTextFieldWithId(placeHolder: "Номер загранпаспорта",
                                              bookingViewModel: bookingViewModel,
                                              validator: bookingViewModel.checkPassportNumber(id:passportNumber:),
                                              id: tooristId,
                                              fieldType: 4)
                        CustomTextFieldWithId(placeHolder: "Срок действия загранпаспорта",
                                              bookingViewModel: bookingViewModel,
                                              validator: bookingViewModel.checkPassportValidityPeriod(id:passportValidityPeriod:),
                                              id: tooristId,
                                              fieldType: 5)
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                } else {
                    HStack {
                        Text(tooristNumber)
                            .font(.system(size: 22).weight(.medium))
                        Spacer()
                        Button(action: {
                            bookingViewModel.toggle[tooristId].toggle()
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
