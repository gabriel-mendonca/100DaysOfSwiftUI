//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 27/04/21.
//

import SwiftUI

struct FilteredList: View {
    
    var fetchRequest: FetchRequest<Singer>
    
    init(filter: String) {
        fetchRequest = FetchRequest(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList(filter: <#String#>)
//    }
//}
