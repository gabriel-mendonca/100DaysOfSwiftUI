//
//  Details.swift
//  Friends
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 01/05/21.
//

import SwiftUI

struct Details: View {
    
    var user: Users
    var body: some View {
        List {
            Section(header: Text("Name")) {
                Text(user.uwName)
            }
            
            Section(header: Text("Age")) {
                Text(String(user.age))
            }
            
            Section(header: Text("Company")) {
                Text(user.uwCompany)
            }
            
            Section(header: Text("Email")) {
                Text(user.uwEmail)
            }
            
            Section(header: Text("Address")) {
                Text(user.uwAddress)
            }
            Section(header: Text("Friend")) {
                ForEach(user.friendArray, id: \.id) { friend in
                    NavigationLink(destination: Details(user: friend)) {
                        VStack(alignment: HorizontalAlignment.leading) {
                            Text(friend.uwName)
                                .font(.headline)
                            Text(friend.uwEmail)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }.navigationBarTitle("\(user.uwName)",displayMode: .inline)
    }
}

struct Details_Previews: PreviewProvider {
    
    static var john: Users {
    let user = Users()
        user.name = "John"
        user.age = 54
        user.address = "cupertino"
        user.company = "Apple"
        user.email = "john.smith@apple.com"
        return user
    }
    static var previews: some View {
        Details(user: john)
    }
}
