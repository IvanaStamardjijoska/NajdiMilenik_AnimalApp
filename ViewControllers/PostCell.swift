//
//  PostCell.swift
//  Project
//
//  Created by CodeWell on 12/24/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postStatsLabel: UILabel!

    
    static let identifier = "PostCell"
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
        
    }
    func updateUI()
    {
        profileImageView.image = post.createdBy.profileImage
        usernameLabel.text = post.createdBy.username
        timeAgoLabel.text = post.timeAgo
        captionLabel.text = post.caption
        postImageView.image = post.image
        postStatsLabel.text = "\(post.numberOfLikes!)  Likes     \(post.numberOfComments!)   Comments     \(post.numberOfShares!)  Shares"
    }
    
    
    
}
