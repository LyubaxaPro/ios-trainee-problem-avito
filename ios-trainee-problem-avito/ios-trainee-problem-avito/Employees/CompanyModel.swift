//
//  File.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//

import Foundation

struct Employee: Codable {
    let name: String
    let phone_number: String
    let skills: [String]
}

struct CompanyModel: Codable {
    
    struct Company: Codable {
        let name: String
        let employees: [Employee]
    }
    
    let company: Company
}

