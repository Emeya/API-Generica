//
//  EmployeeCell.swift
//  API Generica
//
//  Created by Manuel Soberanis on 10/06/20.
//  Copyright © 2020 Archer. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {

    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    let subTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: - Asignando el modelo al cell
    var employeeData: EmployeeData? {
        didSet{
            guard let reportsDataItem = self.employeeData else {return}
            titleLabel.text = "Empleado: \(reportsDataItem.employee_name!)"
            subTitleLabel.text = "Salario: \(reportsDataItem.employee_salary!)MXN"
        }
    }
    
    //MARK: - Layout del tableViewCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        addSubview(subTitleLabel)
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        subTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
