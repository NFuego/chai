//
//  NewsPresenter.swift
//  Project: SuccessfulOrigami
//
//  Module: News
//
//  By ssstand 25/08/2017
//  zcon 2017
//

// MARK: Imports

import UIKit

import SwiftyVIPER

// MARK: Protocols

/// Should be conformed to by the `NewsPresenter` and referenced by `NewsViewController`
protocol NewsViewPresenterProtocol: ViewPresenterProtocol {

}

/// Should be conformed to by the `NewsPresenter` and referenced by `NewsInteractor`
protocol NewsInteractorPresenterProtocol: class {
	/** Sets the title for the presenter
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}

// MARK: -

/// The Presenter for the News module
final class NewsPresenter {

	// MARK: - Constants

	let router: NewsPresenterRouterProtocol
	let interactor: NewsPresenterInteractorProtocol

	// MARK: Variables

	weak var view: NewsPresenterViewProtocol?

	// MARK: Inits

	init(router: NewsPresenterRouterProtocol, interactor: NewsPresenterInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}
}

// MARK: - News View to Presenter Protocol

extension NewsPresenter: NewsViewPresenterProtocol {

	func viewLoaded() {
		interactor.requestTitle()
	}
}

// MARK: News Interactor to Presenter Protocol

extension NewsPresenter: NewsInteractorPresenterProtocol {

	func set(title: String?) {
		view?.set(title: title)
	}
}
