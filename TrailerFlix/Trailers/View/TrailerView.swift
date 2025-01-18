//
//  TrailerView.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 17/01/25.
//

import UIKit

class TrailerView: UIView {
//    @IBOutlet weak var ivTrailer: UIImageView!
    //    @IBOutlet weak var lbTitle: UILabel!
    //    @IBOutlet weak var lbYear: UILabel!
    //    @IBOutlet weak var viTrailer: UIView!
    //    @IBOutlet weak var lbRating: UILabel!

    var ivTrailer: String?

    private lazy var imageViewTrailer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ivTrailer ?? "")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    init(ivTrailer: String?) {
        self.ivTrailer = ivTrailer
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
    }

    func configureView() {
        self.backgroundColor = .black
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewTrailer.topAnchor.constraint(equalTo: self.topAnchor),
            imageViewTrailer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageViewTrailer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageViewTrailer.widthAnchor.constraint(equalToConstant: 350),
        ])
    }

}
