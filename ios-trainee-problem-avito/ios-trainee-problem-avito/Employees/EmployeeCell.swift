//
//  EmployyeeCell.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//

import UIKit
import PinLayout

final class EmployeeCell: UITableViewCell {
    let name = UILabel()
    let nameLabel = UILabel()
    let phoneNumber = UILabel()
    let phoneNumberLabel = UILabel()
    let skills = UILabel()
    let skillsLabel = UILabel()
    private let container = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        name.textColor = .black
        phoneNumber.textColor = .black
        skills.textColor = .black
        nameLabel.textColor = UIColor(red: 0, green: 0, blue: 204, alpha: 1)
        phoneNumberLabel.textColor = UIColor(red: 0, green: 0, blue: 204, alpha: 1)
        skillsLabel.textColor = UIColor(red: 0, green: 0, blue: 204, alpha: 1)
        name.font = .systemFont(ofSize: 15, weight: .regular)
        nameLabel.font = .systemFont(ofSize: 15, weight: .medium)
        phoneNumber.font = .systemFont(ofSize: 15, weight: .regular)
        phoneNumberLabel.font = .systemFont(ofSize: 15, weight: .medium)
        skills.font = .systemFont(ofSize: 15, weight: .regular)
        skillsLabel.font = .systemFont(ofSize: 15, weight: .medium)
        container.layer.cornerRadius = 10
        
        container.clipsToBounds = true
        
        container.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.3)
        
        [name, nameLabel, phoneNumber, phoneNumberLabel, skills, skillsLabel].forEach {
            container.addSubview($0)
        }
        
        contentView.addSubview(container)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        container.pin
            .left(15)
            .right(15)
            .top(8)
            .bottom(8)
        
        nameLabel.pin
            .left(5)
            .top(10)
            .sizeToFit()
        
        name.pin
            .hCenter()
            .top(10)
            .sizeToFit()
        
        phoneNumber.pin
            .below(of: name)
            .marginTop(10)
            .hCenter()
            .sizeToFit()
        
        phoneNumberLabel.pin
            .left(5)
            .below(of: nameLabel)
            .marginTop(10)
            .sizeToFit()
        
        skills.pin
            .below(of: phoneNumber)
            .marginTop(10)
            .hCenter()
            .sizeToFit()
        
        skillsLabel.pin
            .left(5)
            .below(of: phoneNumberLabel)
            .marginTop(10)
            .sizeToFit()
    }
    
    func configure(with model: Employee) {
        name.text = model.name
        nameLabel.text = "Name"
        phoneNumber.text = model.phone_number
        phoneNumberLabel.text = "Phone number"
        var skillsText = ""
        model.skills.forEach {
            skillsText += $0 + " "
        }
        skills.text = skillsText
        skillsLabel.text = "Skills"
    }
}
