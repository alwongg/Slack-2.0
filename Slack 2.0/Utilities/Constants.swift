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

// MARK: - Headers

let HEADER = ["Content-Type" : "application/json; charset=utf-8"]

// MARK: - Segues

let TO_LOGIN = "toLoginVC"
let TO_CREATE_ACCOUNT = "toCreateAccountVC"
let UNWIND = "unwindToChannel"

// MARK: - UserDefaults

let IS_LOGGED_IN = "loggedIn"
let TOKEN_KEY = "token"
let USER_EMAIL = "userEmail"


