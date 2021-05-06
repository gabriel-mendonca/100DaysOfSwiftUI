//
//  DataInitializador.swift
//  Friends
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 30/04/21.
//

import Foundation
import CoreData

struct DataInitializador {
    
    static func loadData(moc: NSManagedObjectContext) {
        
        DispatchQueue.global().async {
            getData { users in
                DispatchQueue.main.async {
                    var tempUsers = [Users]()
                    
                    for user in users {
                        let newUser = Users(context: moc)
                        newUser.id = user.id
                        newUser.name = user.name
                        newUser.age = Int16(user.age ?? 0)
                        newUser.address = user.address
                        newUser.company  = user.company
                        newUser.email = user.email
                        
                        tempUsers.append(newUser)
                    }
                    
                    for i in 0..<users.count {
                        for friends in users[i].friends {
                            if let newFriend = tempUsers.first(where: { $0.id == friends.id }) {
                                tempUsers[i].addToFriends(newFriend)
                            }
                        }
                    }
                    
                    do {
                        try moc.save()
                    } catch let error {
                        print("Could not save data: \(error.localizedDescription)")
                    }
                }
            }
        }
        
    }
    
    
   static func getData(completion: @escaping([User]) -> ()) {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                    return
                }
                
                do {
                    let decoded = try JSONDecoder().decode([User].self, from: data)
                    completion(decoded)
                } catch let decodingError {
                    print("Decoding failed: \(decodingError.localizedDescription)")
                }
            }
        }.resume()
    }
}
