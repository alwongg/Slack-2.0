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
    
    // MARK: - Properties
    
    var avatarType = AvatarType.dark
    
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
        if segmentControl.selectedSegmentIndex == 0{
            //dark selected
            avatarType = .dark
        } else {
            avatarType = .light
        }
        
        avatarPickerCollectionView.reloadData()
    }
    
    // MARK: - Size of CollectionView Cells
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numberOfColumns: CGFloat = 3
        
        //get width of screen size and 320 is the width of the smallest screen size
        if UIScreen.main.bounds.width > 320 {
            numberOfColumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((avatarPickerCollectionView.bounds.width - padding) - (numberOfColumns - 1) * spaceBetweenCells) / numberOfColumns
        
        return CGSize(width: cellDimension, height: cellDimension)
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
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        
        return AvatarCollectionViewCell()
    }
    
    
}
