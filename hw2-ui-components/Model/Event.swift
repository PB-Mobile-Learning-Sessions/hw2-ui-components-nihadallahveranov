//
//  Event.swift
//  hw2-ui-components
//
//  Created by Aynur Asadova on 2022-08-29.
//

import Foundation

struct Event {
    let title: String
    let day: String
    let hour: String
    let status: Status
}

enum Status {
    case done, failed, waiting
}
