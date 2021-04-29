//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 27/04/21.
//

import SwiftUI
import CoreData

enum BeginWith {
    case lastName
    case firstName
}

struct FilteredList: View {
    
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }
    
    init(filter: String,sort: NSSortDescriptor, predicate: BeginWith) {
        var predicateValue: String {
            switch predicate {
            case .firstName:
                return "firstName"
            case .lastName:
                return "lastName"
            }
        }
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [sort], predicate: NSPredicate(format: "%K BEGINSWITH %@",predicateValue, filter))
        
    }
    var body: some View {
        List(singers ,id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}
