//
//  UserViewModel.swift
//  MVVMDemo
//
//  Created by MOMO on 6/5/18.
//  Copyright © 2018 MorniKSA. All rights reserved.
//

import Foundation

struct UserViewModel {
    
    private var user = User()
    
    var username: String{
        return user.username
    }
    
    var password: String{
        return user.password
    }
    
    init(user: User = User()) {
        self.user = user
    }
    
    mutating func setUsername(username: String){
        user.username = username
    }
    
    mutating func setPassword(password: String){
        user.password = password
    }
    
    func dynamicUsername() -> DynamicType<String> {
        let username = DynamicType("")
        username.value = self.username
        return username
    }
    
    func dynamicPassword() -> DynamicType<String> {
        let password = DynamicType("")
        password.value = self.password
        return password
    }
    
    func login() -> DynamicType<String> {
        
        let result = DynamicType("")
        
        if username == "Mohamed" && password == "123456789"{
            result.value = "success"
            return result
        }else{
            result.value = "failed"
            return result
        }
    }
    
}


