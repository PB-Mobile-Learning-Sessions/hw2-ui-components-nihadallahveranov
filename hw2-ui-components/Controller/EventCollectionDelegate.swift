//
//  EventCollectionDelegate.swift
//  hw2-ui-components
//
//  Created by Nihad Allahveranov on 09.09.22.
//

import UIKit

extension EventsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.upcomingEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCell
        cell.setupData(event: MockData.upcomingEvents[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width
        let size = CGSize(width: width - 53, height: 86)
        
        return size
    }
}

