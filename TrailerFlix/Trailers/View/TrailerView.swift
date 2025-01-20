//
//  TrailerView.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 17/01/25.
//

import UIKit

class TrailerView: UIView {
    //    @IBOutlet weak var lbYear: UILabel!
    //    @IBOutlet weak var viTrailer: UIView!
    //    @IBOutlet weak var lbRating: UILabel!

    var ivTrailer: String?
    var lbTitle: String?
    var lbYear: String?
    var lbRating: String?

    private lazy var imageViewTrailer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ivTrailer ?? "")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = self.lbTitle
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var labelYear: UILabel = {
        let label = UILabel()
        label.text = self.lbYear
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(ivTrailer: String?, lbTitle: String?, lbYear: String?, lbRating: String?) {
        self.ivTrailer = ivTrailer
        self.lbTitle = lbTitle
        self.lbYear = lbYear
        self.lbRating = lbRating
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TrailerView: ViewCodable {

    func buildHierarchy() {
        addSubview(imageViewTrailer)
        addSubview(labelTitle)
        addSubview(labelYear)
    }

    func configureView() {
        self.backgroundColor = .black
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewTrailer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageViewTrailer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageViewTrailer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageViewTrailer.widthAnchor.constraint(equalToConstant: 350),

            labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            labelTitle.leadingAnchor.constraint(equalTo: self.imageViewTrailer.trailingAnchor, constant: 10),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelYear.topAnchor.constraint(equalTo: self.labelTitle.bottomAnchor, constant: 10),
            labelYear.leadingAnchor.constraint(equalTo: self.imageViewTrailer.trailingAnchor, constant: 10),
            labelYear.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }

}
