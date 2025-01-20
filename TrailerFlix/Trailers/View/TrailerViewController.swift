//
//  TrailerViewController.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 12/01/25.
//

import UIKit

class TrailerViewController: UIViewController {

    var trailerViewModel: TrailerViewModel?

    var trailer: Trailer?
    var trailerView: TrailerView?

    override func loadView() {
        super.loadView()
        guard let trailer = trailer else {
                return
            }
        trailerView = TrailerView(ivTrailer: trailer.poster, lbTitle: trailer.title, lbYear: String(trailer.year), lbRating: trailer.rating)
        self.view = trailerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewModel()
    }

    func prepareViewModel() {
        guard let trailerView = self.trailerView, let trailer = self.trailer else { return }
        trailerViewModel = TrailerViewModel(view: trailerView.trailerView, trailer: trailer)
    }
    init(trailer: Trailer) {
        super.init(nibName: nil, bundle: nil)
        self.trailer = trailer
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
