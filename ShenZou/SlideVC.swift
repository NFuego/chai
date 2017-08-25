import Foundation

class SlideVC : OptsVC, OptsDecoration {

    static let aboutVC = UINavigationController(rootViewController: WelcomeVC())
    static let fundamentalOpts = UINavigationController(rootViewController: FundamentalVC())
    
    // Chai
    static let newsVC = UINavigationController(rootViewController: NewsModule().view)

    // For any single origami in the SlideVC should conform to VCDecoration protocol and setNavHeader
    static let swallow = UINavigationController(rootViewController: BirdBase())


    override func buildOpts(){

        var header = MenuOpt(title:i18n("茶 - 關於此App"),targetVC:SlideVC.aboutVC,icon:"")
        header.header = true
            menuOpts = [
                        header,
                        MenuOpt(title:i18n("茶 - 每日快訊"),targetVC:SlideVC.newsVC,icon:""),
                        MenuOpt(title:i18n("茶 - 每日優惠"),targetVC:SlideVC.newsVC,icon:""),
                        MenuOpt(title:i18n("茶 - 創意飲茶"),targetVC:SlideVC.newsVC,icon:""),
                        MenuOpt(title:i18n("茶 - 茶飲功效"),targetVC:SlideVC.newsVC,icon:""),
                        MenuOpt(title:i18n("茶 - 茶飲知識"),targetVC:SlideVC.newsVC,icon:""),
                        MenuOpt(title:i18n("茶 - 詩詞"),targetVC:SlideVC.newsVC,icon:""),
                        MenuOpt(title:i18n("茶 - 粉絲團"),targetVC:SlideVC.newsVC,icon:""),
                        
        ]
    }

    override func whenHighlight(_ cell: UITableViewCell) {

        let cell = cell as! MenuOptCell
        cell.backgroundColor = self.randomBGColor()
        cell.lbVal.textColor = .white
    }

    override func whenUnhighlight(_ cell: UITableViewCell) {
        let cell = cell as! MenuOptCell
        cell.backgroundColor = UIColor.white
        cell.lbVal.textColor = UIColor.options
    }
    
//    override func showVC(_ vc:UIViewController){
////        self.pushViewController(vc,animated:true):
//        self.navigationController?.pushViewController(vc,animated:true)
//
//    }
} // fin SlideVC

// MARK: - SlideVC helper
extension SlideVC {

}
