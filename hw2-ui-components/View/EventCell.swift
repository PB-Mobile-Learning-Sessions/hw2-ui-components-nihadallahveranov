//
//  EventCell.swift
//  hw2-ui-components
//
//  Created by Nihad Allahveranov on 09.09.22.
//

import UIKit
import SnapKit

class EventCell: UICollectionViewCell {
    
    lazy var cell: UIStackView = {
        let stack = UIStackView(frame: CGRect(origin: .zero, size: CGSize(width: 322, height: 74)))
        stack.layer.cornerRadius = 16
        stack.backgroundColor = .white
        stack.addSubview(statusImage)
        stack.addSubview(eventsLabel)
        stack.addSubview(eventTimeLabel)
        stack.addSubview(eventEllipsisLabel)
        
        self.addSubview(stack)
       
        return stack
    }()
    
    lazy var statusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 26).isActive = true


        return imageView
    }()

    lazy var eventsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "doneEvent")
        label.font = UIFont.boldSystemFont(ofSize: 16)

        return label
    }()

    lazy var eventTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "eventTimeLabel")

        return label
    }()

    private lazy var eventEllipsisLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "eventEllipsisLabel")
        label.text = "..."
        
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
            make.height.equalTo(74)
        }
        
        statusImage.snp.makeConstraints() { make in
            make.top.equalTo(self.cell.snp.top).offset(24)
            make.left.equalTo(self.cell.snp.left).offset(22)
        }

        eventsLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.cell.snp.top).offset(16)
            make.left.equalTo(self.cell.snp.left).offset(65)
        }

        eventTimeLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.eventsLabel.snp.bottom).offset(4)
            make.left.equalTo(self.statusImage.snp.right).offset(17)
        }

        eventEllipsisLabel.snp.makeConstraints() { make in
            make.bottom.equalTo(self.cell.snp.top).offset(19.47)
            make.right.equalTo(self.cell.snp.right).offset(-16.13)
        }
    }
    
    func setupData(event: Event) {
        if event.status == .waiting {
            statusImage.frame = CGRect(origin: .zero, size: CGSize(width: 26, height: 26))
            statusImage.backgroundColor = UIColor(named: "waitingEvent")
            statusImage.layer.cornerRadius = 13
        } else {
            statusImage.image = UIImage(named: "\(event.status)")
        }
        
        self.eventTimeLabel.text = "\(event.day), \(event.hour)"
        self.eventsLabel.text = "\(event.title)"
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "\(event.title)")
        
        let range = NSRange(location: 0, length: attributeString.length)
        
        switch event.status {
        case .waiting:
            attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range)
        case .done:
            attributeString.addAttribute(
                NSAttributedString.Key.strikethroughStyle, value: 2,
                range: range)
        case .failed:
            attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "failedEvent") ?? UIColor.red, range: range)
        }

        self.eventsLabel.attributedText = attributeString
    }
}
