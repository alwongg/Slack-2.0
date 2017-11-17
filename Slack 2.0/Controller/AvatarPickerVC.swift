//
//  AvatarPickerVC.swift
//  Slack 2.0
//
//  Created by Alex Wong on 11/16/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Outlets

    @IBOutlet weak var avatarPickerCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarPickerCollectionView.delegate = self
        avatarPickerCollectionView.dataSource = self
    }

    // MARK: - Actions
    
    @IBAction func dismissAvatarPickerVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
    }
    
    // MARK: - Collection View Protocol Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = avatarPickerCollectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCollectionViewCell{
            return cell
        }
        
        return AvatarCollectionViewCell()
    }
    
    
}
