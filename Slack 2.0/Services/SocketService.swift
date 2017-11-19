//
//  SocketService.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/18/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    let socketManager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress]).defaultSocket
    
    func establishConnection(){
        socketManager.connect()
    }
    
    func closeConnection(){
        socketManager.disconnect()
    }
    
    // send out to api
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socketManager.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    // observer - listen for channels
    
    func getChannel(completion: @escaping CompletionHandler){
        socketManager.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDescription = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDescription, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
}
