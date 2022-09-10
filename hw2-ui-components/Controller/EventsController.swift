//
//  EventsController.swift
//  hw2-ui-components
//
//  Created by Nihad Allahveranov on 09.09.22.
//

import UIKit
import SnapKit

class EventsController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Events"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        self.view.addSubview(label)
        
        return label
    }()
    
    private lazy var upcomingEventsLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming Events"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        self.view.addSubview(label)
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.register(EventCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = UIColor(named: "mainColor")
        self.view.addSubview(view)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupViews() {
        titleLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.view.snp.top).offset(63)
            make.left.equalTo(self.view.snp.left).offset(27)
        }
        
        upcomingEventsLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(24)
            make.left.equalTo(self.view.snp.left).offset(27)
        }
        
        collectionView.snp.makeConstraints() { make in
            make.top.equalTo(self.upcomingEventsLabel.snp.bottom).offset(14)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }

}
