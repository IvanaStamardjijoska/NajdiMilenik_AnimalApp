//
//  PostCell.swift
//  Project
//
//  Created by Lazar Simonovski on 11/26/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit
class PostCell: UITableViewCell {
    
    @IBOutlet var profileImage: UITableView!
    @IBOutlet var usernameLabel: UITableView!
    @IBOutlet var TimeAgoLabel: UITableView!
    @IBOutlet var captionLabel: UITableView!
    @IBOutlet var postImage: UITableView!
    @IBOutlet var postStatsLabel: UILabel!
    
    
     var post: Post!{
        didSet {
            self.updateUI()
        }
    }
    func updateUI() {
        profileImage.image = post.createdBy.profileImageView
        usernameLabel.text = post.timeAgo
        captionLabel.text = post.caption
        postImage.image = post.image
        postStatsLabel = "\(post.numberOfLikes!)  Likes   \(post.numberOfComments!)    Comments \(post.numberOfShares)  Shares"
    }
    
}
