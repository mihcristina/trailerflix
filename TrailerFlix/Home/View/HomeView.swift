//
//  HomeView.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 16/01/25.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func tappedRandonButton()
}

class HomeView: UIView {

    weak var delegate: HomeViewDelegate?

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
        tableview.backgroundColor = .clear
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        return tableview
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var buttonView: UIButton = {
        let button = UIButton()
        button.setTitle("Assistir Trailer aleatório", for: .normal)
        button.setTitleColor(UIColor(red: 220/255, green: 75/255, blue: 70/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tappedButton() {
        delegate?.tappedRandonButton()
    }

    func setDelegateAndDataSource(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

    func reloadData() {
        tableView.reloadData()
    }

}

extension HomeView: ViewCodable {

    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
        addSubview(imageView)
        addSubview(buttonView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            imageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            imageView.leadingAnchor.constraint(equalTo: self.tableView.trailingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalToConstant: 250),

            buttonView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 10),
            buttonView.leadingAnchor.constraint(equalTo: self.tableView.trailingAnchor, constant: 10),
            buttonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
        ])
    }

    func configureView() {
        self.backgroundColor = UIColor(red: 250/255, green: 234/255, blue: 78/255, alpha: 1.0)
    }

}
