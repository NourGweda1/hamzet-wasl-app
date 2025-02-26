//
//  Event.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 16/02/2025.
//

import Foundation
import SwiftUICore

struct Event: Decodable {
    var id: String?
    var name: String?
    var location: String?
    var time: String?
    var eventID: Int?
    var eventCategory: String?
    var language: String?
    var eventType: String?
    var city: String?
    var date: String?
    var eventImage: String?
    var similarity: Double?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case eventID = "event_id"
        case date
        case eventCategory = "event_category"
        case language
        case eventType = "event_type"
        case location = "country"
        case city
        case eventImage = "image_URL"
        case similarity = "$similarity"
        case name, time
    }
}

func fetchEventsList() -> [Event] {
    return [
        Event(id: "1",
              name: Constants.EventsConstants.firstEvent,
              location: Constants.EventsConstants.firstLocation,
              time: Constants.EventsConstants.firstTime,
              date: Constants.EventsConstants.firstDate,
              eventImage: IconsConstants.EventsConstantsIcons.firstEventIC),
        Event(id: "2",
              name: Constants.EventsConstants.secondEvent,
              location: Constants.EventsConstants.secondLocation,
              time: Constants.EventsConstants.secondTime,
              date: Constants.EventsConstants.secondDate,
              eventImage: IconsConstants.EventsConstantsIcons.secondEventIC),
        Event(id: "3",
              name: Constants.EventsConstants.thirdEvent,
              location: Constants.EventsConstants.thirdLocation,
              time: Constants.EventsConstants.thirdTime,
              date: Constants.EventsConstants.thirdDate,
              eventImage: IconsConstants.EventsConstantsIcons.thirdEventIC),
        Event(id: "4",
              name: Constants.EventsConstants.fourthEvent,
              location: Constants.EventsConstants.fourthLocation,
              time: Constants.EventsConstants.fourthTime,
              date: Constants.EventsConstants.fourthDate,
              eventImage: IconsConstants.EventsConstantsIcons.fourthEventIC),
        Event(id: "5",
              name: Constants.EventsConstants.fifthEvent,
              location: Constants.EventsConstants.fifthLocation,
              time: Constants.EventsConstants.fifthTime,
              date: Constants.EventsConstants.fifthDate,
              eventImage: IconsConstants.EventsConstantsIcons.fifthEventIC),
        Event(id: "6",
              name: Constants.EventsConstants.sixthEvent,
              location: Constants.EventsConstants.sixthLocation,
              time: Constants.EventsConstants.sixthTime,
              date: Constants.EventsConstants.sixthDate,
              eventImage: IconsConstants.EventsConstantsIcons.sixthEventIC),
        Event(id: "7",
              name: Constants.EventsConstants.seventhEvent,
              location: Constants.EventsConstants.seventhLocation,
              time: Constants.EventsConstants.seventhTime,
              date: Constants.EventsConstants.seventhDate,
              eventImage: IconsConstants.EventsConstantsIcons.seventhEventIC),
        Event(id: "8",
              name: Constants.EventsConstants.eighthEvent,
              location: Constants.EventsConstants.eighthLocation,
              time: Constants.EventsConstants.eighthTime,
              date: Constants.EventsConstants.eighthDate,
              eventImage: IconsConstants.EventsConstantsIcons.eighthEventIC),
        Event(id: "9",
              name: Constants.EventsConstants.ninthEvent,
              location: Constants.EventsConstants.ninthLocation,
              time: Constants.EventsConstants.ninthTime,
              date: Constants.EventsConstants.ninthDate,
              eventImage: IconsConstants.EventsConstantsIcons.ninthEventIC),
        Event(id: "10",
              name: Constants.EventsConstants.tenthEvent,
              location: Constants.EventsConstants.tenthLocation,
              time: Constants.EventsConstants.tenthTime,
              date: Constants.EventsConstants.tenthDate,
              eventImage: IconsConstants.EventsConstantsIcons.tenthEventIC)
    ]
}
