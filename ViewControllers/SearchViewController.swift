//
//  SearchViewController.swift
//  Project
//
//  Created by Lazar Simonovski on 11/25/18.
//  Copyright © 2018 Ivana Stamardjioska. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
     var searchController: UISearchController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupSearchController()
        
        // Do any additional setup after loading the view.
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
