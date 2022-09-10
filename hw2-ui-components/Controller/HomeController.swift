//
//  HomeController.swift
//  hw2-ui-components
//
//  Created by Nihad Allahveranov on 09.09.22.
//

import UIKit
import SnapKit

class HomeController: UIViewController {
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Progress"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        self.view.addSubview(label)
        
        return label
    }()
    
    private lazy var progressView: UIStackView = {
        let view = UIStackView(frame: CGRect(x: 0, y: 0, width: 320, height: 165))
        view.backgroundColor = UIColor(named: "progressView")
        view.layer.cornerRadius = 24
        view.addSubview(progressTitleLbl)
        view.addSubview(progressCompletionLbl)
        view.addSubview(progressWithPercentageImg)
        self.view.addSubview(view)
        
        return view
    }()
    
    private lazy var progressTitleLbl: UILabel = {
        let label = UILabel()
        label.text = "Today’s progress summary"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var progressCompletionLbl: UILabel = {
        let label = UILabel()
        label.text = "4 of 8 completed"
        label.textColor = UIColor(named: "completionLbl")
        label.font = UIFont.boldSystemFont(ofSize: 11)
        
        return label
    }()
    
    private lazy var progressWithPercentageImg: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "percentage"))
        imageView.contentMode = .scaleToFill
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        return imageView
    }()
    
    private lazy var historyLabel: UILabel = {
        let label = UILabel()
        label.text = "Activity History"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        self.view.addSubview(label)
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.register(HomeCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = UIColor(named: "mainColor")
        self.view.addSubview(view)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupViews()
    }
    
    func setupViews() {
        titleLbl.snp.makeConstraints() { make in
            make.top.equalTo(self.view.snp.top).offset(62)
            make.left.equalTo(self.view.snp.left).offset(28)
        }
        
        progressView.snp.makeConstraints() { make in
            make.top.equalTo(self.titleLbl.snp.bottom).offset(17)
            make.left.equalTo(self.view.snp.left).offset(28)
            make.bottom.equalTo(self.view.snp.top).offset(280)
            make.right.equalTo(self.view.snp.right).offset(-27)
        }
        
        progressTitleLbl.snp.makeConstraints() { make in
            make.top.equalTo(self.progressView.snp.top).offset(32)
            make.left.equalTo(self.progressView.snp.left).offset(26.08)
            make.right.equalTo(self.progressView.snp.right).offset(-120.38)
            make.bottom.equalTo(self.progressView.snp.bottom).offset(-85)
        }
        
        progressCompletionLbl.snp.makeConstraints() { make in
            make.top.equalTo(self.progressTitleLbl.snp.bottom).offset(22)
            make.left.equalTo(self.progressTitleLbl.snp.left)
        }
        
        progressWithPercentageImg.snp.makeConstraints() { make in
            make.top.equalTo(self.progressView.snp.top).offset(42)
            make.right.equalTo(self.progressView.snp.right).offset(-17.05)
        }
        
        historyLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.progressView.snp.bottom).offset(49)
            make.left.equalTo(self.view.snp.left).offset(28)
        }
        
        collectionView.snp.makeConstraints() { make in
            make.top.equalTo(self.historyLabel.snp.bottom).offset(20)
            make.left.equalTo(self.view.snp.left).offset(28)
            make.right.equalTo(self.view.snp.right).offset(-27)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }

}
