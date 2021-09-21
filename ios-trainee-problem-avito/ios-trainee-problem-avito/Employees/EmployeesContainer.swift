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

	class func assemble(with context: EmployeesContext) -> EmployeesContainer {
        let router = EmployeesRouter()
        let interactor = EmployeesInteractor()
        let presenter = EmployeesPresenter(router: router, interactor: interactor)
		let viewController = EmployeesViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        router.sourceViewController = viewController

        return EmployeesContainer(view: viewController, input: presenter)
	}

    private init(view: UIViewController, input: EmployeesModuleInput) {
		self.viewController = view
        self.input = input
	}
}

struct EmployeesContext {
	weak var moduleOutput: EmployeesModuleOutput?
}
