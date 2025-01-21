//
//  HomeViewController.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 12/01/25.
//

import UIKit

class HomeViewController: UIViewController {

    var homeViewModel: HomeViewModel?
    var homeView: HomeView?

    override func loadView() {
        super.loadView()
        homeView = HomeView()
        self.view = homeView
        homeView?.setDelegateAndDataSource(delegate: self, dataSource: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel = HomeViewModel()
        homeViewModel?.delegate = self
        homeViewModel?.loadTrailersFromJson()
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel?.numberOfTrailers() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = homeViewModel?.titleOfTrailer(at: indexPath.row)
        cell.detailTextLabel?.text = homeViewModel?.yearOfTrailer(at: indexPath.row)
        cell.imageView?.image = UIImage(named: (homeViewModel?.posterOfTrailer(at: indexPath.row)) ?? "")
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        homeViewModel?.showTrailer(index: index)
    }

}

extension HomeViewController: HomeViewModelDelegate {

    func navigateToRandowTrailerDetails(trailer: Trailer) {
        let trailerViewController = TrailerViewController(trailer: trailer)
        navigationController?.pushViewController(trailerViewController, animated: true)
    }

    func didLoadTrailers() {
        DispatchQueue.main.async {
            self.homeView?.reloadData()
        }
    }
    
    func didFailToLoadMovies() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro ao carregar os trailers. Tente novamente mais tarde!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }

    func navigateToTrailerDetails(trailer: Trailer) {
        let trailerViewController = TrailerViewController(trailer: trailer)
        navigationController?.pushViewController(trailerViewController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {
    func tappedRandonButton() {
        
    }

}
