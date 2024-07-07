//
//  MovieTableViewCell.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    private let releaseDateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(posterImageView)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        posterImageView.roundCorners(radius: Constants.UI.cornerRadius)
        posterImageView.applyShadow(radius: Constants.UI.shadowRadius, opacity: Constants.UI.shadowOpacity)
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.UI.padding),
            posterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 60),
            posterImageView.heightAnchor.constraint(equalToConstant: 90),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Constants.UI.padding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.UI.padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.UI.padding),
            
            releaseDateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Constants.UI.padding),
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.UI.padding),
            releaseDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.UI.padding)
        ])
        
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = Constants.UI.primaryTextColor
        
        releaseDateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        releaseDateLabel.textColor = Constants.UI.secondaryTextColor
        
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.originalTitle
        releaseDateLabel.text = movie.releaseDate
        if let url = URL(string: movie.posterPath) {
            posterImageView.loadImage(from: url)
        }
    }
}
