//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    private init() {}
    
    var repositories = [GithubRepository]()

    func getRepositoriesFromAPI(completion: @escaping ()->()) {
        
        self.repositories = []
        
        GithubAPIClient.getRepositories { repoData in
            
            for repo in repoData {
                self.repositories.append(GithubRepository(dictionary: repo))
            }
            completion()
        }
        
    }
    
}
