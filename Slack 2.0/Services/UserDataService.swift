//
//  UserDataService.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/16/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import Foundation

class UserDataService{
    
    static let instance = UserDataService()
    
    // create public getter - other classes can read
    // other classes cannot set though since it is private
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
}
