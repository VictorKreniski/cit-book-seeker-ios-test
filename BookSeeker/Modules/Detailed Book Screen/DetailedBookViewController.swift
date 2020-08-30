//
//  DetailedBookViewController.swift
//  BookSeeker
//
//  Created by Victor Kreniski on 29/08/20.
//  Copyright © 2020 CIT. All rights reserved.
//

import UIKit

final class DetailedBookViewController: UIViewController, Drawable {
    let coverImageView = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let genresLabel = UILabel()
    let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
    let starsEvaluationLabel = UILabel()
    let recomendationsLabel = UILabel()
    let priceLabel = UILabel()
    let containerView = UIView()
    let bookDescriptionLabel = UILabel()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    let book: Book
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
    lazy var verticalStackView: UIStackView = {
       let stackview = UIStackView(arrangedSubviews:
        [coverImageView, titleLabel, authorLabel, genresLabel,
         recomendationStackView, priceLabel, bookDescriptionLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fill
        stackview.spacing = 10
        return stackview
    }()
    init(selectedBook: Book) {
        self.book = selectedBook
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        let view = UIView(frame: UIScreen.main.bounds)
        self.view = view
        draw()
    }
    func buildViewHierarchy() {
        view.addSubview(containerView)
        containerView.addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
    }
    func stylizeView() {
        navigationController?.navigationBar.tintColor = .black
        containerView.roundCorners(corners: [.topLeft, .topRight], radius: 8)
        view.backgroundColor = Constants.Design.primaryPink
        containerView.backgroundColor = .white
        bookDescriptionLabel.numberOfLines = 0
        coverImageView.contentMode = .redraw
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.tintColor = .black
        authorLabel.numberOfLines = 0
        authorLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        authorLabel.tintColor = .lightGray
        genresLabel.numberOfLines = 0
        genresLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        genresLabel.tintColor = .lightGray
        starsEvaluationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        starImageView.tintColor = .black
        recomendationsLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        recomendationsLabel.tintColor = .lightGray
        priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        priceLabel.tintColor = .black
        bookDescriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        bookDescriptionLabel.tintColor = .black
        bookDescriptionLabel.textAlignment = .justified
    }
    func makeConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive = true
        scrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15).isActive = true
        scrollView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15).isActive = true
        verticalStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        verticalStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        verticalStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        coverImageView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor).isActive = true
    }
    func setupAdditionalConfigurations() {
        updateWith(book)
    }
}

extension DetailedBookViewController {
    func updateWith(_ book: Book) {
        let bookCoverUrlWithHigherQuality = book.imageUrl.replacingOccurrences(of: "100x100", with: "500x500")
        coverImageView.imageFromURL(urlString: bookCoverUrlWithHigherQuality)
        titleLabel.text = book.name
        authorLabel.text = "by: "+book.author
        genresLabel.text = "Genres: "+book.genres.joined(separator: ", ")
        bookDescriptionLabel.text = book.description
        starsEvaluationLabel.text = "\(book.rating)"
        recomendationsLabel.text = "(\(book.ratingCount))"
        priceLabel.text = book.price > 0 ? "$\(book.price) " + book.currency : "Free"
    }
}
