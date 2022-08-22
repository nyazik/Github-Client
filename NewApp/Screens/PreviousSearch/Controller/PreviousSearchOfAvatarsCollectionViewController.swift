//
//  PreviousSearchOfAvatarsCollectionViewController.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 20.08.2022.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "previousSearch"

class PreviousSearchOfAvatarsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var previousSearchOfAvatarsVM : PreviousSearchOfAvatarsViewModel!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        fetchAvatarsFromDB()
    }
    
    //MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return previousSearchOfAvatarsVM.numberOfSections
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return previousSearchOfAvatarsVM.numberOfRowInSection(section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PreviousSearchCollectionViewCell else { fatalError(" emojiCell cell not found")  }
        let vm = previousSearchOfAvatarsVM.articleAtIndex(indexPath.row)
        cell.avatarImageView.cl_setImage(urlString: vm.image)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 15)
    }
 
}


//MARK: - ACTIONS
extension PreviousSearchOfAvatarsCollectionViewController {
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
}

//MARK: - FETCH FROM DB
extension PreviousSearchOfAvatarsCollectionViewController {
    
    func fetchAvatarsFromDB() {
        let avatars = realm.objects(SavesAvatarsModel.self)
        previousSearchOfAvatarsVM = PreviousSearchOfAvatarsViewModel(savedAvatarsModel: avatars)
        self.collectionView.reloadData()
    }
    
}

//MARK: - UI
extension PreviousSearchOfAvatarsCollectionViewController {
    
    func customizeUI() {
        self.collectionView.backgroundColor = .lightGray
    }
    
}
