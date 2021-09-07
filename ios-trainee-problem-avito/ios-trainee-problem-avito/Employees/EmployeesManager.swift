//
//  EmployeesManager.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//

import Foundation

final class EmployeesManager: EmployeesManagerDescription {
    
    static let shared: EmployeesManagerDescription = EmployeesManager()
    
    private init(){}
    
    func loadData(complition: @escaping (Result<CompanyModel, Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else {
            complition(.failure(Errors.urlError))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                complition(.failure(Errors.dataTaskError))
                return
            }
            
            guard let data = data else {
                complition(.failure(Errors.dataError))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let responce = try decoder.decode(CompanyModel.self, from: data)
                complition(.success(responce))
            } catch let error {
                complition(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
