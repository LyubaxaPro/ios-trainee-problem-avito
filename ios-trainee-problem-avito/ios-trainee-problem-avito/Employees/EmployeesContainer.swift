//
//  EmployeesContainer.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//  
//

import UIKit

final class EmployeesContainer {
    let input: EmployeesModuleInput
	let viewController: UIViewController
	private(set) weak var router: EmployeesRouterInput!

	class func assemble(with context: EmployeesContext) -> EmployeesContainer {
        let router = EmployeesRouter()
        let interactor = EmployeesInteractor()
        let presenter = EmployeesPresenter(router: router, interactor: interactor)
		let viewController = EmployeesViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return EmployeesContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: EmployeesModuleInput, router: EmployeesRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct EmployeesContext {
	weak var moduleOutput: EmployeesModuleOutput?
}
