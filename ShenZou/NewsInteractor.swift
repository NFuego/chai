//
//  NewsInteractor.swift
//  Project: SuccessfulOrigami
//
//  Module: News
//
//  By ssstand 25/08/2017
//  zcon 2017
//

// MARK: Imports

import Foundation

import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `NewsInteractor` and referenced by `NewsPresenter`
protocol NewsPresenterInteractorProtocol {
	/// Requests the title for the presenter
	func requestTitle()
}

// MARK: -

/// The Interactor for the News module
final class NewsInteractor {

	// MARK: - Variables

	weak var presenter: NewsInteractorPresenterProtocol?
}

// MARK: - News Presenter to Interactor Protocol

extension NewsInteractor: NewsPresenterInteractorProtocol {

	func requestTitle() {
		presenter?.set(title: "News")
	}
}
