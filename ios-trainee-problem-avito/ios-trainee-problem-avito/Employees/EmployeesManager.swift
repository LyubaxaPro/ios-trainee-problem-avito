//
//  EmployeesManager.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//

import Foundation

class CacheData {
    var companyData: CompanyModel
    var lastCacheTime: Date
    
    init (companyData: CompanyModel, lastCacheTime: Date) {
        self.companyData = companyData
        self.lastCacheTime = lastCacheTime
    }
}

final class EmployeesManager: EmployeesManagerDescription {
    
    static let shared: EmployeesManagerDescription = EmployeesManager()
    private let cache = NSCache<NSString, CacheData>()
    let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    let timeInterval: Double = 60 * 60
    
    private init(){}
    
    func loadData(complition: @escaping (Result<CompanyModel, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            complition(.failure(Errors.urlError))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {[weak self] data, _, error in
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
                let cacheData = CacheData(companyData: responce, lastCacheTime: Date())
                self?.cache.setObject(cacheData, forKey: (self?.urlString ?? "") as NSString)

                complition(.success(responce))
            } catch let error {
                complition(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func getData(complition: @escaping (Result<CompanyModel, Error>) -> Void) {
        if let data = cache.object(forKey: urlString as NSString){
            let currentInterval = Date().timeIntervalSince1970 - data.lastCacheTime.timeIntervalSince1970
            if currentInterval < timeInterval {
                complition(.success(data.companyData))
                return
            }
            loadData(complition: complition)
            
        } else {
            loadData(complition: complition)
        }
    }
    
}
