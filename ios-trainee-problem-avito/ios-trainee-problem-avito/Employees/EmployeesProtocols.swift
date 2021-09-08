//
//  EmployeesProtocols.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//  
//

import Foundation

protocol EmployeesModuleInput {
	var moduleOutput: EmployeesModuleOutput? { get }
}

protocol EmployeesModuleOutput: AnyObject {
}

protocol EmployeesViewInput: AnyObject {
    func reloadData()
}

protocol EmployeesViewOutput: AnyObject {
    func viewDidLoad()
    func getName() -> String
    func getEmployees() -> [Employee]
    func didPullRefresh()
}

protocol EmployeesInteractorInput: AnyObject {
    func load()
}

protocol EmployeesInteractorOutput: AnyObject {
    func didLoad(data: CompanyModel)
    func didReceive(error: Error)
}

protocol EmployeesRouterInput: AnyObject {
    func showAlert(with message: String)
}

protocol EmployeesManagerDescription: AnyObject {
    func loadData(complition: @escaping (Result<CompanyModel, Error>) -> Void)
    func getData(complition: @escaping (Result<CompanyModel, Error>) -> Void)
}
