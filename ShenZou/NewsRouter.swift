//
//  NewsRouter.swift
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

/// Should be conformed to by the `NewsRouter` and referenced by `NewsPresenter`
protocol NewsPresenterRouterProtocol: PresenterRouterProtocol {

}

// MARK: -

/// The Router for the News module
final class NewsRouter {

	// MARK: - Variables

	weak var viewController: UIViewController?
}

// MARK: - Router Protocol

extension NewsRouter: RouterProtocol {

}

// MARK: News Presenter to Router Protocol

extension NewsRouter: NewsPresenterRouterProtocol {

}
