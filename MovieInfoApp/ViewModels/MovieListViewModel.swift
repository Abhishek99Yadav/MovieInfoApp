//
//  MovieListViewModel.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import Foundation

class MovieListViewModel {
    private var movies: [Movie] = []
    private var filteredMovies: [Movie] = []
    private var isFetching = false
    var reloadTableView: (() -> Void)?
    
    func fetchMovies() {
            guard !isFetching else { return }
            isFetching = true
            
            NetworkManager.shared.request(url: Constants.API.baseURL, responseType: MoviesResponse.self) { (result: Result<MoviesResponse, Error>) in
                self.isFetching = false
                switch result {
                case .success(let response):
                    self.movies.append(contentsOf: response.data)
                    self.filteredMovies = self.movies
                    self.reloadTableView?()
                case .failure(let error):
                    print("Error fetching movies: \(error)")
                }
            }
        }
    func numberOfRows() -> Int {
        return filteredMovies.count
    }
    
    func movieAt(indexPath: IndexPath) -> Movie? {
        return filteredMovies[indexPath.row]
    }
    
    func searchMovies(query: String) {
        if query.isEmpty {
            filteredMovies = movies
        } else {
            filteredMovies = movies.filter { $0.originalTitle.lowercased().contains(query.lowercased()) }
        }
        reloadTableView?()
    }
}
