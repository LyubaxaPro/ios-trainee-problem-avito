//
//  EmployeesInteractor.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//  
//

import Foundation

final class EmployeesInteractor {
	weak var output: EmployeesInteractorOutput?
    private let manager: EmployeesManagerDescription = EmployeesManager.shared
}

extension EmployeesInteractor: EmployeesInteractorInput {
    func load() {
        manager.loadData() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.output?.didLoad(data: data)
                case .failure(let error):
                    self?.output?.didReceive(error: error)
                }
            }
        }
    }
}
