//
//  RatingVIew.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import SwiftUI

struct RatingView: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 149, height: 29)
                .foregroundStyle(Color(UIColor(red: 255 / 255, green: 199 / 255, blue: 0 / 255, alpha: 0.20)))
            
            Text(text)
                .font(.system(size: 16).weight(.medium))
                .foregroundStyle(Color(UIColor(red: 255 / 255, green: 168 / 255, blue: 0 / 255, alpha: 1)))
        }
    }
}
