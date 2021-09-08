//
//  EmployeesRouter.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//  
//

import UIKit

final class EmployeesRouter {
    var sourceViewController: EmployeesViewController?
}

extension EmployeesRouter: EmployeesRouterInput {
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(ok)
        sourceViewController?.navigationController?.present(alert, animated: true)
    }
}
