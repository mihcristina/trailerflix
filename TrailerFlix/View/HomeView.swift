//
//  HomeView.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 16/01/25.
//

import UIKit

class HomeView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Como deseja ver seus TRAILERS?"
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView: UITableView = {
       let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()

    func setDelegateAndDataSource(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

    func reloadData() {
        tableView.reloadData()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HomeView: ViewCodable {

    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: self.tableView.leadingAnchor),
        ])
    }

    func configureView() {
        self.backgroundColor = UIColor(red: 250/255, green: 234/255, blue: 78/255, alpha: 1.0)
    }

}
