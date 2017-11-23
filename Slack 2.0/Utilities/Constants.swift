//
//  Constants.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/20/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import Foundation

//handle asynchronous web requests using completionHandler
//typealias -> renaming a type
typealias CompletionHandler = (_ Success : Bool) -> ()

// MARK: - URL

let BASE_URL = "https://chattyslack3.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"

// MARK: - Headers

let HEADER = ["Content-Type" : "application/json; charset=utf-8"]
let BEARER_HEADER = [
    "Authorization" : "Bearer \(AuthService.instance.authToken)",
    "Content-Type" : "application/json; charset=utf-8"
]

// MARK: - Segues

let TO_LOGIN = "toLoginVC"
let TO_CREATE_ACCOUNT = "toCreateAccountVC"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPickerVC"

// MARK: - UserDefaults

let IS_LOGGED_IN = "loggedIn"
let TOKEN_KEY = "token"
let USER_EMAIL = "userEmail"

// MARK: - Colors

let PURPLE_TEXT_PLACEHOLDER = #colorLiteral(red: 0.7996886872, green: 0.5119449176, blue: 1, alpha: 0.5)

// MARK: - Notifications

let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")


