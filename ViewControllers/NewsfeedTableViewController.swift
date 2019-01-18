//
//  NewsfeedTableViewController.swift
//  FacebookFeedsApp
//
//  Created by Ivana on 12/18/18.
//  Copyright © 2018 Ivana. All rights reserved.
//

import UIKit

class NewsfeedTableViewController: UITableViewController {
    
    var searchController: UISearchController!
    
    var posts: [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchController()
        self.fetchPost()
        
        tableView.separatorStyle = .none
        
        // dynamic view cell height
        
       
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func fetchPost()
    {
        self.posts = Post.fetchPosts()
        tableView.reloadData()
    }
    
    func setupSearchController() {
        
        
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.barStyle = .black
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
    }
    
    
}

//MARK: UITableViewDelegateSource

extension NewsfeedTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        } else{
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.post = self.posts?[indexPath.row]
        return cell
        
    }
}
