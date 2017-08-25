//
//  NewsViewController.swift
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
import ElongationPreview

// MARK: Protocols

/// Should be conformed to by the `NewsInteractor` and referenced by `NewsPresenter`
protocol NewsPresenterViewProtocol: class {
	/** Sets the title for the view
	- parameters:
		- title The title to set
	*/
	func set(title: String?)
}

// MARK: -

/// The View Controller for the News module
class NewsViewController: ElongationViewController {

	// MARK: - Constants

	let presenter: NewsViewPresenterProtocol

    var datasource: [Villa] = Villa.testData
	// MARK: Variables

	// MARK: Inits

	init(presenter: NewsViewPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
        
	}

	// MARK: - Load Functions

	override func viewDidLoad() {
    	super.viewDidLoad()
		presenter.viewLoaded()

        tableView.backgroundColor = .black
        tableView.separatorStyle  = .none
        tableView.register(UINib(nibName: "DemoElongationCell", bundle: nil), forCellReuseIdentifier: "DemoElo")
        
        self.addLeftBarButtonWithImage( UIImage.icon(from: .MaterialIcon, code: "dehaze", imageSize: CGSize(width:30,height:30), ofSize: 30))
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
      
    override func openDetailView(for indexPath: IndexPath) {
//      let id = String(describing: DetailViewController.self)
//      guard let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? DetailViewController else { return }
//      let villa = datasource[indexPath.row]
//      detailViewController.title = villa.title
//      expand(viewController: detailViewController)
        return
        self.present(SlideVC.swallow, animated: true) { 
            
        }
    }
}

// MARK: - News Presenter to View Protocol

extension NewsViewController: NewsPresenterViewProtocol {

	func set(title: String?) {
        self.title = i18n("menu.news")
	}
}


extension NewsViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datasource.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeue(DemoElongationCell.self)
    let cell = tableView.dequeueReusableCell(withIdentifier: "DemoElo")
    return cell!
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    super.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    guard let cell = cell as? DemoElongationCell else { return }
    
    let villa = datasource[indexPath.row]
    
    let attributedLocality = NSMutableAttributedString(string: villa.locality.uppercased(), attributes: [
//      NSFontAttributeName: UIFont.robotoFont(ofSize: 22, weight: .medium),
      NSFontAttributeName: UIFont.systemFont(ofSize: 22),
      NSKernAttributeName: 8.2,
      NSForegroundColorAttributeName: UIColor.white
      ])
    
    cell.topImageView?.image = UIImage(named: villa.imageName)
    cell.localityLabel?.attributedText = attributedLocality
    cell.countryLabel?.text = villa.country
    cell.aboutTitleLabel?.text = villa.title
    cell.aboutDescriptionLabel?.text = villa.description
  }
  
}
