//
//  Post.swift
//  FacebookFeedsApp
//
//  Created by Ivana on 12/18/18.
//  Copyright © 2018 Ivana. All rights reserved.
//

import UIKit

struct  User {
    
    var username: String?
    var profileImage: UIImage?
    
}



struct Post {
    
    var createdBy: User
    var timeAgo: String?
    var caption: String?
    var image: UIImage?
    var numberOfLikes: Int?
    var numberOfComments: Int?
    var numberOfShares: Int?
    
    
    static func fetchPosts() -> [Post] {
        
        var posts = [Post] ()
        
        let  ivanaStam = User(username: "Ivana Stamardjiovska", profileImage: UIImage(named: "vet"))
        let post1 = Post(createdBy: ivanaStam, timeAgo: "1 hr", caption: "Kuceto e izgubeno na ulica Dime Anicin", image: UIImage(named: "ivana"), numberOfLikes: 9, numberOfComments: 82, numberOfShares: 74)
        
        
        
        let  lazarStam = User(username: "Ivana Stamardjiovska", profileImage: UIImage(named: "vet"))
        let post2 = Post(createdBy: ivanaStam, timeAgo: "1 hr", caption: "Kuceto e izgubeno na ulica Dime Anicin", image: UIImage(named: "ivana"), numberOfLikes: 9, numberOfComments: 82, numberOfShares: 74)
        posts.append(post1)
         posts.append(post2)
        return posts
    }
    
}



