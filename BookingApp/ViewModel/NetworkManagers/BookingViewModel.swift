//
//  BookingNetworkManager.swift
//  BookingApp
//
//  Created by Дмитрий Ерофеев on 16.12.2023.
//

import Foundation


class BookingViewModel: ObservableObject {
    
    @Published var bookingInfo: BookingInfo? = nil
    
    func initBookingInfo(link: String) async {
        Task {
            guard let info = await getHotelRooms(link: link) else {
                print("info not found")
                return
            }
            await MainActor.run {
                bookingInfo = BookingInfo(id: info.id,
                                          hotelName: info.hotelName,
                                          hotelAdress: info.hotelAdress,
                                          horating: info.horating,
                                          ratingName: info.ratingName,
                                          departure: info.departure,
                                          arrivalCountry: info.arrivalCountry,
                                          tourDateStart: info.tourDateStart,
                                          tourDateStop: info.tourDateStart,
                                          numberOfNights: info.numberOfNights,
                                          room: info.room,
                                          nutrition: info.nutrition,
                                          tourPrice: info.tourPrice,
                                          fuelCharge: info.fuelCharge,
                                          serviceCharge: info.serviceCharge)
            }
        }
    }
    
    
    func getHotelRooms(link: String) async -> Welcome? {
        guard let link = URL(string: link ) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: link)
            return try! JSONDecoder().decode(Welcome.self, from: data)
        } catch {
            return nil
        }
    }
    
    
    struct Welcome: Codable {
        let id: Int
        let hotelName, hotelAdress: String
        let horating: Int
        let ratingName, departure, arrivalCountry, tourDateStart: String
        let tourDateStop: String
        let numberOfNights: Int
        let room, nutrition: String
        let tourPrice, fuelCharge, serviceCharge: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case hotelName = "hotel_name"
            case hotelAdress = "hotel_adress"
            case horating
            case ratingName = "rating_name"
            case departure
            case arrivalCountry = "arrival_country"
            case tourDateStart = "tour_date_start"
            case tourDateStop = "tour_date_stop"
            case numberOfNights = "number_of_nights"
            case room, nutrition
            case tourPrice = "tour_price"
            case fuelCharge = "fuel_charge"
            case serviceCharge = "service_charge"
        }
    }
    
    func matchesRegex(string: String, regexPattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: [])
            let range = NSRange(location: 0, length: string.utf16.count)
            let matches = regex.matches(in: string, options: [], range: range)
            return matches.count > 0
        } catch {
            print("Invalid regex: \(error.localizedDescription)")
            return false
        }
    }
    
    @Published var email = ""
    @Published var emailIsValid = true
    
    func checkEmail(email: String) -> Bool {
        self.email = email
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if emailPredicate.evaluate(with: email) {
            return true
        } else {
            return false
        }
    }
    
    
    @Published var contactInformationValidator = [true, true]
    
    @Published var phoneNumber = ""
    @Published var phoneNumberIsValid = true
    func checkPhoneNumver(phoneNumber: String) -> Bool {
        self.phoneNumber = phoneNumber
        if phoneNumber.filter({$0.isNumber}).count == 11 {
            return true
        } else {
            return false
        }
    }
    

    
    func addTorist() {

            if toorists.count < 10 {
                toorists.append(TooristValidator(tooristNumber: tooristsCount, tooristNumberName: tooristsLabels[tooristsCount]))
            } else {
                toorists.append(TooristValidator(tooristNumber: tooristsCount, tooristNumberName: "Турист \(tooristsCount + 1)"))
            }
            toggle.append(false)
        
        tooristsCount += 1
        print(toggle)
    }
    
    @Published var toorists = [TooristValidator(tooristNumber: 0, tooristNumberName: "Первый турист"),
                               TooristValidator(tooristNumber: 1, tooristNumberName: "Второй турсит")]
    var tooristsCount = 2
    let tooristsLabels = ["Первый турист", "Второй турист", "Третий турист", "Четвертый турист", "Пятый турист",
                          "Шестой турист", "Седьмой турист", "Восьмой турист", "Девятый турист", "Десятый турист"]
    
    @Published var toggle = [false, false]
    
    
    func checkFirstName(id: Int, name: String) -> Bool {
        if !name.isEmpty {
            toorists[id].validator[0] = true
        }
        toorists[id].values[0] = name
        return toorists[id].validator[0]
    }
    func checkSurname(id: Int, surname: String) -> Bool {
        if !surname.isEmpty {
            toorists[id].validator[1] = true
        }
        toorists[id].values[1] = surname
        return toorists[id].validator[1]
    }
    func checkBirthday(id: Int, birthday: String) -> Bool {
        if !birthday.isEmpty {
            toorists[id].validator[2] = true
        }
        toorists[id].values[2] = birthday
        return toorists[id].validator[2]
    }
    func checkСitizenship(id: Int, citizenship: String) -> Bool {
        if !citizenship.isEmpty {
            toorists[id].validator[3] = true
        }
        toorists[id].values[3] = citizenship
        return toorists[id].validator[3]
    }
    func checkPassportNumber(id: Int, passportNumber: String) -> Bool {
        if !passportNumber.isEmpty {
            toorists[id].validator[4] = true
        }
        toorists[id].values[4] = passportNumber
        return toorists[id].validator[4]
    }
    func checkPassportValidityPeriod(id: Int, passportValidityPeriod: String) -> Bool {
        if !passportValidityPeriod.isEmpty {
            toorists[id].validator[5] = true
        }
        toorists[id].values[5] = passportValidityPeriod
        return toorists[id].validator[5]
    }
    
    
    func validateForPay() {
        if contactInformationValidator[0] && phoneNumber.count == 0 {
            print("phone false")
            contactInformationValidator[0] = false
        }
        if contactInformationValidator[1] && email.count == 0 {
            print("email false")
            contactInformationValidator[1] = false
        }
        for j in 0..<6 {
            if toorists[0].values[j].count == 0 {
                toorists[0].validator[j] = false
            }
        }
        for i in 1..<toorists.count {
            if toorists[i].values.filter({$0.count == 0}).count != 6 {
                for j in 0..<6 {
                    if toorists[i].values[j].count == 0 {
                        toorists[i].validator[j] = false
                    }
                }
            }
        }
    }
    
    func isRadyForPay() -> Bool {
        for j in 0..<6 {
            if toorists[0].values[j].count == 0 {
                return false
            }
        }
        for i in 1..<toorists.count {
            if toorists[i].values.filter({$0.count == 0}).count != 6 {
                for j in 0..<6 {
                    if toorists[i].values[j].count == 0 {
                        return false
                    }
                }
            }
        }
        return true && phoneNumberIsValid && emailIsValid
    }
    
    func getCountOfPeople() -> Int {
        var count = 0
        for i in toorists {
            if i.values.filter({$0.count != 0}).count == 6 {
                count += 1
            }
        }
        if count == 0 {
            count = 1
        }
        return count
    }
}

