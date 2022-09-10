//
//  ScheduleController.swift
//  hw2-ui-components
//
//  Created by Nihad Allahveranov on 09.09.22.
//

import UIKit
import SnapKit

class ScheduleController: UIViewController {

    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Schedule"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        self.view.addSubview(label)
        
        return label
    }()
    
    private lazy var titleCalendarIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar-icon")
        self.view.addSubview(imageView)
            
        return imageView
    }()
    
    private lazy var scheduleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        label.text = "\(formatter.string(from: date))"
        label.textColor = UIColor(named: "scheduleLabel")
        self.view.addSubview(label)
        return label
    }()
    
    @objc func datePickerChanged(datePicker: UIDatePicker) {
        let date = datePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        self.scheduleLable.text = "\(formatter.string(from: date))"
    }
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = Locale.init(identifier: "us")
        datePicker.preferredDatePickerStyle = .inline
        datePicker.tintColor = .systemBlue
        datePicker.backgroundColor = .white
        datePicker.layer.cornerRadius = 13
        datePicker.layer.masksToBounds = true
        
        datePicker.addTarget(self, action: #selector(self.datePickerChanged(datePicker:)), for: .valueChanged)
        
        self.view.addSubview(datePicker)
        
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        titleLable.snp.makeConstraints() { make in
            make.top.equalTo(self.view.snp.top).offset(64)
            make.left.equalTo(self.view.snp.left).offset(28)
        }
        
        titleCalendarIcon.snp.makeConstraints() { make in
            make.top.equalTo(self.view.snp.top).offset(70)
            make.right.equalTo(self.view.snp.right).offset(-29.4)
        }
        
        scheduleLable.snp.makeConstraints() { make in
            make.top.equalTo(self.titleLable.snp.bottom).offset(9)
            make.left.equalTo(self.view.snp.left).offset(28)
        }
        
        datePicker.snp.makeConstraints() { make in
            make.bottom.equalTo(self.view.snp.bottom)
            make.left.equalTo(self.view.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).offset(-16)
        }
    }

}
