//
//  MovieDetailViewController.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    private let movie: Movie
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let overviewLabel = UILabel()
    private let castLabel = UILabel()
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.UI.backgroundColor
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        castLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(castLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            posterImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 200),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.UI.padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.UI.padding),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.UI.padding),
            releaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.UI.padding),
            
            overviewLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 10),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.UI.padding),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.UI.padding),
            
            castLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 10),
            castLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.UI.padding),
            castLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.UI.padding),
            castLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        posterImageView.roundCorners(radius: Constants.UI.cornerRadius)
        posterImageView.applyShadow(radius: Constants.UI.shadowRadius, opacity: Constants.UI.shadowOpacity)
        
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = Constants.UI.primaryTextColor
        
        releaseDateLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        releaseDateLabel.textColor = Constants.UI.secondaryTextColor
        
        overviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        overviewLabel.textColor = Constants.UI.primaryTextColor
        overviewLabel.numberOfLines = 0
        
        castLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        castLabel.textColor = Constants.UI.primaryTextColor
        castLabel.numberOfLines = 0
    }
    
    private func configureUI() {
        titleLabel.text = movie.originalTitle
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
        overviewLabel.text = "Overview: \(movie.overview)"
        let castNames = movie.casts.map { $0.name }.joined(separator: ", ")
        castLabel.text = "Cast: \(castNames)"
        
        ImageLoader.loadImage(urlString: movie.posterPath, into: posterImageView)
    }
}
