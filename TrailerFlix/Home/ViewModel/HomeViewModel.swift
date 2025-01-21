//
//  HomeViewModel.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 16/01/25.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didLoadTrailers()
    func didFailToLoadMovies()
    func navigateToTrailerDetails(trailer: Trailer)
    func navigateToRandowTrailerDetails(trailer: Trailer)
}

class HomeViewModel {

    var trailers: [Trailer] = []
    var delegate: HomeViewModelDelegate?

    func loadTrailersFromJson() {
        guard let url = Bundle.main.url(forResource: "trailers", withExtension: "json") else {
            print("Arquivo não encontrado.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.trailers = try decoder.decode([Trailer].self, from: data)
            delegate?.didLoadTrailers()
        } catch {
            delegate?.didFailToLoadMovies()
        }
    }

    func numberOfTrailers() -> Int {
        return trailers.count
    }

    func titleOfTrailer(at index: Int) -> String {
        return trailers[index].title
    }

    func yearOfTrailer(at index: Int) -> String {
        return String(trailers[index].year)
    }

    func ratingOfTrailer(at index: Int) -> String {
        return String(trailers[index].year)
    }

    func posterOfTrailer(at index: Int) -> String {
        return trailers[index].poster
    }

    func watchRandomTrailer() {
        let randowIndex = Int(arc4random_uniform(UInt32(trailers.count)))
        let trailer = trailers[randowIndex]
        delegate?.navigateToRandowTrailerDetails(trailer: trailer)
    }

    func showTrailer(index: Int) {
        let trailer = trailers[index]
        delegate?.navigateToTrailerDetails(trailer: trailer)
    }

}
