//
//  EmojiListCollectionViewController.swift
//  NewApp
//
//  Created by Nyazik Byashimova on 18.08.2022.
//

import UIKit

private let reuseIdentifier = "emojiCell"

class EmojiListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var emojiListVM : MainLlistOfEmojiesViewModel?
    var result: [EmojiModel]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let result = result else {
            return
        }
        emojiListVM = MainLlistOfEmojiesViewModel(emojiModel: result)
        customizeUI()
    }
    
    //MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        if emojiListVM == nil {
            self.collectionView.reloadData()
        }
        return emojiListVM?.numberOfSections ?? 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiListVM?.numberOfRowInSection(section) ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? EmojiCellCollectionViewCell else { fatalError(" emojiCell cell not found")  }
        let vm = emojiListVM?.articleAtIndex(indexPath.row)
        DispatchQueue.global().async {
            cell.emojiImageView.cl_setImage(urlString: vm?.image)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.height / 3 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 15)
    }
    
}

//MARK: - UI

extension EmojiListCollectionViewController {
    
    func customizeUI() {
        self.collectionView.backgroundColor = .blue
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "EmojiList"
    }
    
}

//MARK: - ACTIONS

extension EmojiListCollectionViewController {
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
}
