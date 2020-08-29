//
//  BookTableViewCell.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 29/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class BookTableViewCell: UITableViewCell, Drawable {
    let coverImageView = UIImageView()
    let authorLabel = UILabel()
    let titleLabel = UILabel()
    let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
    let starsEvaluationLabel = UILabel()
    let recomendationsLabel = UILabel()
    let priceLabel = UILabel()
    lazy var recomendationStackView: UIStackView = {
        let stackview = UIStackView(
            arrangedSubviews: [starImageView, starsEvaluationLabel, recomendationsLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 2
        stackview.distribution = .fillProportionally
        stackview.alignment = .firstBaseline
        return stackview
    }()
    lazy var bottomHorizontalStackView: UIStackView = {
        let stackview = UIStackView(
            arrangedSubviews: [recomendationStackView, priceLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
        return stackview
    }()
    lazy var nameAndAuthorStackViewVertical: UIStackView = {
        let stackview = UIStackView(
            arrangedSubviews: [authorLabel, titleLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .top
        stackview.spacing = 2
        stackview.distribution = .fillProportionally
        return stackview
    }()
    lazy var verticalStackView: UIStackView = {
        let stackview = UIStackView(
            arrangedSubviews: [nameAndAuthorStackViewVertical, bottomHorizontalStackView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .equalCentering
        return stackview
    }()
    lazy var mainHorizontalStackView: UIStackView = {
        let stackview = UIStackView(
            arrangedSubviews: [coverImageView, verticalStackView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 10
        stackview.distribution = .fill
        return stackview
    }()
    func buildViewHierarchy() {
        addSubview(mainHorizontalStackView)
    }
    func stylizeView() {
        contentView.roundCorners(corners: .allCorners, radius: 8)
        contentView.clipsToBounds = true
        authorLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        authorLabel.tintColor = .lightGray
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        titleLabel.tintColor = .black
        titleLabel.numberOfLines = 3
        starImageView.tintColor = .white
        starsEvaluationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        starsEvaluationLabel.tintColor = .white
        recomendationsLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        recomendationsLabel.tintColor = .lightGray
        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        priceLabel.tintColor = .white
    }
    func makeConstraints() {
        mainHorizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainHorizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        mainHorizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainHorizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
                                                constant: 15).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -20).isActive = true
        coverImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,
                                            constant: 20).isActive = true
        coverImageView.heightAnchor.constraint(equalTo: coverImageView.widthAnchor,
                                               multiplier: 1.0/0.65).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        recomendationsLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
    }

}

extension BookTableViewCell {
    func updateWith(_ book: Book) {
        coverImageView.imageFromURL(urlString: book.imageUrl)
        authorLabel.text = book.author
        titleLabel.text = book.name
        if let rating = book.rating {
            starsEvaluationLabel.text = "\(rating)"
        }
        if let recomendation = book.ratingCount {
            recomendationsLabel.text = "(\(recomendation))"
        }
        priceLabel.text = "\(book.price)"
    }
}
