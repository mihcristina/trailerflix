//
//  TrailerView.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 17/01/25.
//

import UIKit

class TrailerView: UIView {

    var ivTrailer: String?
    var lbTitle: String?
    var lbYear: String?
    var lbRating: Int?
    
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
    
    private lazy var labelRating: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var trailerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(ivTrailer: String?, lbTitle: String?, lbYear: String?, lbRating: Int?) {
        self.ivTrailer = ivTrailer
        self.lbTitle = lbTitle
        self.lbYear = lbYear
        self.lbRating = lbRating
        super.init(frame: .zero)
        setupView()
        prepareLabelRatingComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareLabelRatingComponent() {
        prepareRating { rating in
            self.labelRating.text = rating
        }
    }

    func prepareRating(completion: @escaping (String) -> Void) {
        
        DispatchQueue.global().async {
            let trailerRating = self.fetchRatingFromServer()
            var rating = ""
            
            if trailerRating > 0 {
                rating = ""
                for _ in 1...trailerRating {
                    rating += "⭐️"
                }
            }
            DispatchQueue.main.async {
                completion(rating)
            }
        }
    }

    func fetchRatingFromServer() -> Int {
        sleep(1)
        return self.lbRating ?? 0
    }
}

extension TrailerView: ViewCodable {

    func buildHierarchy() {
        addSubview(imageViewTrailer)
        addSubview(labelTitle)
        addSubview(labelYear)
        addSubview(labelRating)
        addSubview(trailerView)
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

            labelRating.topAnchor.constraint(equalTo: self.labelTitle.bottomAnchor, constant: 10),
            labelRating.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            trailerView.topAnchor.constraint(equalTo: self.labelYear.bottomAnchor, constant: 10),
            trailerView.leadingAnchor.constraint(equalTo: self.imageViewTrailer.trailingAnchor, constant: 10),
            trailerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            trailerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

}
