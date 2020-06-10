//
//  EmployeeModelData.swift
//  API Generica
//
//  Created by Manuel Soberanis on 10/06/20.
//  Copyright © 2020 Archer. All rights reserved.
//

import Foundation


//MARK: - Estructura del json
struct EmployeeJson: Codable {
    let status : String?
    let data : [EmployeeData]
}

struct EmployeeData: Codable {
    let id : String?
    let employee_name : String?
    let employee_salary: String?
    let employee_age : String
    let profile_image : String?
    
}
