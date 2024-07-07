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
        
        NetworkManager.shared.request(url: Constants.API.baseURL) { (result: Result<Data, Error>) in
            self.isFetching = false
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(MoviesResponse.self, from: data)
                    self.movies.append(contentsOf: response.data)
                    self.filteredMovies = self.movies
                    self.reloadTableView?()
                } catch {
                    print("Decoding error: \(error)")
                }
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
