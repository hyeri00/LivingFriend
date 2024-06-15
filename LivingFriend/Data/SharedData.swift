//
//  SharedData.swift
//  LivingFriend
//
//  Created by 혜리 on 6/15/24.
//

import Foundation

final class SharedData {
    
    static let shared = SharedData()
    
    private init() {}
    
    var selectedTitle: String?
}
