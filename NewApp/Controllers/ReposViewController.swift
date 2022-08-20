//
//  NewsListTableViewController.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 12.08.2022.
//

import UIKit

class ReposViewController: UITableViewController {

    private var repoVM : ListOfReposViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRepos()
        customizeUI()
    }
    func fetchRepos() {
        RepoManager.getRepos { result in
            self.repoVM = ListOfReposViewModel(repoModel: result)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }
    func customizeUI() {
        self.tableView.backgroundColor = .lightGray
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Repositories"
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return repoVM == nil ? 0 : repoVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoVM.numberOfRowInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as? RepoCell else { fatalError(" repos cell not found") }
        let vm = repoVM.articleAtIndex(indexPath.row)
        cell.title.text = vm.image
        return cell
    }
    
}

