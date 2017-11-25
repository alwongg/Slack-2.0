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
    
    //NSObject therefore must have initializer
    
    override init(){
        super.init()
    }
    
    var socket = SocketManager(socketURL: URL(string: BASE_URL)!).defaultSocket
    
    func establishConnection(){
        socket.connect()
    }
    
    func closeConnection(){
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler){
        socket.on("channelCreated") { (dataArray, ack) in
            print("Getting Channels")
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDescription = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDescription, id: channelId)
            
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
}
