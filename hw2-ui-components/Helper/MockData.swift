//
//  MockData.swift
//  hw2-ui-components
//
//  Created by Aynur Asadova on 2022-08-29.
//

import Foundation

class MockData {
    static let activityHistory = [
        Activity(month: "July", done: 98),
        Activity(month: "June", done: 90),
        Activity(month: "May", done: 90),
        Activity(month: "April", done: 74),
        Activity(month: "March", done: 74)
    ]
    
    static let upcomingEvents = [
        Event(
            title: "Sitemap & User Flow",
            day: "Today",
            hour: "9:00 pm",
            status: .done),
        Event(
            title: "Sitemap & User Flow",
            day: "Today",
            hour: "9:00 pm",
            status: .done),
        Event(
            title: "Sitemap & User Flow",
            day: "Today",
            hour: "9:00 pm",
            status: .done),
        Event(
            title: "Sitemap & User Flow",
            day: "Today",
            hour: "9:00 pm",
            status: .done),
        Event(
            title: "Groominh",
            day: "Today",
            hour: "11:00 pm",
            status: .waiting),
        Event(
            title: "Moodboard",
            day: "Today",
            hour: "11:30 pm",
            status: .failed),
        Event(
            title: "Moodboard",
            day: "Today",
            hour: "11:30 pm",
            status: .failed),
        Event(
            title: "Groominh",
            day: "Today",
            hour: "11:00 pm",
            status: .waiting)
    ]
}
