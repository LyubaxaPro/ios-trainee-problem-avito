//
//  EmployeesPresenter.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//  
//

import Foundation

final class EmployeesPresenter {
	weak var view: EmployeesViewInput?
    weak var moduleOutput: EmployeesModuleOutput?
    var companyData: CompanyModel?

	private let router: EmployeesRouterInput
	private let interactor: EmployeesInteractorInput

    init(router: EmployeesRouterInput, interactor: EmployeesInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension EmployeesPresenter: EmployeesModuleInput {
}

extension EmployeesPresenter: EmployeesViewOutput {
    func getName() -> String {
        return companyData?.company.name ?? ""
    }
    
    func getEmployees() -> [Employee] {
        return companyData?.company.employees ?? []
    }
    
    func viewDidLoad() {
        interactor.load()
    }
    
    func didPullRefresh() {
        interactor.load()
    }
}

extension EmployeesPresenter: EmployeesInteractorOutput {
    func didLoad(data: CompanyModel) {
        companyData = data
        companyData?.company.employees.sort {(lhs: Employee, rhs: Employee) -> Bool in
            return lhs.name < rhs.name
        }
                                    
        self.view?.reloadData()
    }
    
    func didReceive(error: Error) {
        var message: String
        switch error{
        case Errors.urlError:
             message = "API is not available"
        case Errors.dataTaskError:
            message = "Network error"
        case Errors.dataError:
            message = "Data is empty"
        case Errors.decoderError:
            message = "Wrong data format"
        default:
            message = "Unexpected error"
        }
        
        router.showAlert(with: message)
    }
}
