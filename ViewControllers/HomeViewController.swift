//
//  HomeViewController.swift
//  Project
//
//  Created by Lazar Simonovski on 11/25/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post]?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postStatsLabel: UILabel!
    

    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        
        self.fetchPost()
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        // dynamic view cell height
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(UINib(nibName: PostCell.identifier, bundle: nil), forCellReuseIdentifier: PostCell.identifier)

        // Do any additional setup after loading the view.
        
       
    
        
    }
    func fetchPost()
    {
        self.posts = Post.fetchPosts()
        tableView.reloadData()
    }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        } else{
            return 0
        }
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.post = self.posts?[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 528
    }

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





