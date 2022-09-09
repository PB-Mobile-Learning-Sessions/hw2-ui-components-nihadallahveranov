//
//  HomeCell.swift
//  hw2-ui-components
//
//  Created by Nihad Allahveranov on 09.09.22.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    lazy var cell: UIStackView = {
        let stack = UIStackView(frame: CGRect(origin: .zero, size: CGSize(width: 153, height: 135)))
        stack.layer.cornerRadius = 24
        stack.addSubview(cellImage)
        stack.addSubview(ellipsisLabel)
        stack.addSubview(monthLabel)
        stack.addSubview(percentLabel)
        self.addSubview(stack)
    
        return stack
    }()
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "history"))
        imageView.contentMode = .scaleToFill
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        self.addSubview(imageView)
        
        return imageView
    }()
    
    private lazy var ellipsisLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textColor = UIColor(named: "ellipsisLabel")
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        cell.snp.makeConstraints() { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(135)
        }
        
        cellImage.snp.makeConstraints() { make in
            make.top.equalTo(self.cell.snp.top).offset(27)
            make.left.equalTo(self.cell.snp.left).offset(23)
        }
        
        ellipsisLabel.snp.makeConstraints() { make in
            make.bottom.equalTo(self.cellImage.snp.top).offset(1.53)
            make.right.equalTo(self.cell.snp.right).offset(-19.13)
        }
        
        monthLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.cellImage.snp.bottom).offset(10)
            make.left.equalTo(self.cell.snp.left).offset(23)
        }
        
        percentLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.monthLabel.snp.bottom).offset(4)
            make.left.equalTo(self.cell.snp.left).offset(23)
        }
    }
    
    func setupData(activity: Activity) {
        self.monthLabel.text = activity.month
        self.percentLabel.text = String(activity.done) + "%"
        self.cell.backgroundColor = UIColor(named: "homeCellPink")
    }
    
}
