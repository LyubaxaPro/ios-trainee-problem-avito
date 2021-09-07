//
//  EmployeesViewController.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//  
//

import UIKit
import PinLayout

final class EmployeesViewController: UIViewController {
	private let output: EmployeesViewOutput
    let tableView = UITableView()

    init(output: EmployeesViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "EmployeeCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        
        output.viewDidLoad()
	}
    
    override func viewDidLayoutSubviews() {
        tableView.pin
            .top(view.pin.safeArea.top)
            .right(view.pin.safeArea.right)
            .left(view.pin.safeArea.left)
            .bottom(view.pin.safeArea.bottom)
    }
}

extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.getEmployees().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as? EmployeeCell else {
            return .init()
        }
        
        cell.layer.cornerRadius = 10
        
        cell.configure(with: output.getEmployees()[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
extension EmployeesViewController: EmployeesViewInput {
    func reloadData() {
        tableView.reloadData()
        title = output.getName()
    }
    
}
