//
//  Users+CoreDataProperties.swift
//  Friends
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 30/04/21.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var friends: NSSet?
    
    public var uwName: String {
        name ?? ""
    }
    
    public var uwCompany: String {
        company ?? ""
    }
    
    public var uwEmail: String {
        email ?? ""
    }
    
    public var uwAddress: String {
        address ?? ""
    }
    
    public var friendArray: [Users] {
        let set = friends as? Set<Users> ?? []
        return set.sorted{ $0.uwName < $1.uwName}
    }

}

extension Users {
    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Users)
    
    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: Users)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriendss:)
    @NSManaged public func removeFromFriends(_ values: NSSet)
}

extension Users: Identifiable {
    
}
