//
//  ContentView.swift
//  Friends
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 30/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Users.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<Users>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: Details(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.uwName)
                            .font(.headline)
                        Text(user.uwEmail)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                }
                }
            }.navigationBarTitle("Friends")
        } .onAppear(perform: checkDataLoad)
    }
    
    func checkDataLoad() {
        if users.isEmpty {
            DataInitializador.loadData(moc: moc)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
