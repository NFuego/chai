//
//  NewsModule.swift
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

// MARK: -

/// Used to initialize the News VIPER module
final class NewsModule {

	// MARK: - Variables

	private(set) lazy var interactor: NewsInteractor = {
		return NewsInteractor()
	}()

	private(set) lazy var router: NewsRouter = {
		return NewsRouter()
	}()

	private(set) lazy var presenter: NewsPresenter = {
		return NewsPresenter(router: self.router, interactor: self.interactor)
	}()

	private(set) lazy var view: NewsViewController = {
		return NewsViewController(presenter: self.presenter)
	}()

	init() {
		presenter.view = view
		router.viewController = view
		interactor.presenter = presenter
	}
}

// MARK: - Module Protocol

extension NewsModule: ModuleProtocol {
	var viewController: UIViewController { return view }
}
