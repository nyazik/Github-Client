//
//  NewsListTableViewController.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 12.08.2022.
//

import UIKit

class ReposViewController: UITableViewController {
    
    private var repoVM : ListOfReposViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRepos()
        customizeUI()
    }
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return repoVM?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoVM?.numberOfRowInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as? RepoCell else { fatalError(" repos cell not found") }
        let vm = repoVM?.articleAtIndex(indexPath.row)
        cell.title.text = vm?.image
        return cell
    }
    
}

//MARK: - ACTIONS
extension ReposViewController {
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
}


//MARK: - FETCH REPOSITORIES

extension ReposViewController {
    func fetchRepos() {
        RepoManager.getRepos { result in
            switch result {
            case .success(let result) :
                self.repoVM = ListOfReposViewModel(repoModel: result)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
}

//MARK: - UI

extension ReposViewController {
    func customizeUI() {
        self.tableView.backgroundColor = .lightGray
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Repositories"
    }
}
