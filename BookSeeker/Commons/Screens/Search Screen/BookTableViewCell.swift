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
    let containerView = UIView()
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
        return stackview
    }()
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(mainHorizontalStackView)
    }
    func stylizeView() {
        containerView.backgroundColor = Constants.Design.secondaryPink
        containerView.roundCorners(corners: .allCorners, radius: 8)
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
        coverImageView.contentMode = .scaleAspectFit
    }
    func makeConstraints() {
        containerView.backgroundColor = Constants.Design.secondaryPink
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        recomendationsLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        mainHorizontalStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        mainHorizontalStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        mainHorizontalStackView.rightAnchor.constraint(equalTo: containerView.rightAnchor,
                                                       constant: -10).isActive = true
        mainHorizontalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                        constant: -10).isActive = true
        coverImageView.heightAnchor.constraint(equalTo: coverImageView.widthAnchor,
                                               multiplier: 1.0/0.8).isActive = true
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
        priceLabel.text = book.price > 0 ? "$\(book.price) " + book.currency : "Free"
    }
}
