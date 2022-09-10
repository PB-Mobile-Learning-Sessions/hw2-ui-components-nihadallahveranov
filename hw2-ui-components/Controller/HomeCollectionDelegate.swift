//
//  CollectionDelegate.swift
//  hw2-ui-components
//
//  Created by Nihad Allahveranov on 09.09.22.
//

import UIKit

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.activityHistory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        cell.setupData(activity: MockData.activityHistory[indexPath.row])
        cell.cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor(named: "homeCellPink") : UIColor(named: "homeCellYellow")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width
        let size = CGSize(width: (width - 67) / 2, height: 147)
        
        return size
    }
}
