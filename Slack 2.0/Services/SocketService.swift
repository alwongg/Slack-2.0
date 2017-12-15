//
//  SocketService.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/24/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init(){
        super.init()
    }
    
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
    
    func establishConnection(){
        manager.defaultSocket.connect()
    }
    
    func closeConnection(){
        manager.defaultSocket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        manager.defaultSocket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler){
        manager.defaultSocket.on("channelCreated") { (dataArray, ack) in
            print("Getting Channels")
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDescription = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDescription, id: channelId)
            
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler){
        
        let user = UserDataService.instance
        manager.defaultSocket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        
        completion(true)
    }
    
    func getChatMessage(completion: @escaping CompletionHandler){
        manager.defaultSocket.on("messageCreated") { (dataArray, ack) in
            guard let messageBody = dataArray[0] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            guard let userName = dataArray[3] as? String else {return}
            guard let userAvatar = dataArray[4] as? String else {return}
            guard let userAvatarColor = dataArray[5] as? String else {return}
            guard let id = dataArray[6] as? String else {return}
            guard let timeStamp = dataArray[7] as? String else {return}
            
            if channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn {
                let newMessage = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                
                MessageService.instance.messages.append(newMessage)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String : String]) -> Void) {
        manager.defaultSocket.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String : String] else {return}
            completionHandler(typingUsers)
        }
    }
}














