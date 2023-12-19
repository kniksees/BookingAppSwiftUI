//
//  Entitys.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 17.12.2023.
//

import Foundation

struct ImageIdentifible: Identifiable {
    var id = UUID()
    var data: Data
}


struct idLink: Hashable {
    static func == (lhs: idLink, rhs: idLink) -> Bool {
        lhs.id == rhs.id
    }
    var id: Int
    var link: String
}


