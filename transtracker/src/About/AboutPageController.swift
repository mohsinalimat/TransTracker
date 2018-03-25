//
//  AboutPageController.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import UIKit

class AboutPageController: UITableViewController {
    @IBOutlet var rateOnTheAppstore: UITableViewCell!
    @IBOutlet var sendComment: UITableViewCell!
    @IBOutlet var followOnTwitter: UITableViewCell!
    @IBOutlet var viewOnGithub: UITableViewCell!
    @IBOutlet var appVersion: UILabel!
    
    override func viewDidLoad() {
        let appVersionString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        appVersion.text? = (appVersion?.text?.replacingOccurrences(of: "{0}", with: appVersionString))!
    }
    
    func sendMailComment()
    {
        var urlLink = "mailto:TransTracker@adinunno.fr?subject=Commentaire sur TransTrack"
        urlLink = (urlLink.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)) ?? "mailto:TransTracker@adinunno.fr"
        let url = NSURL(string: urlLink)
        UIApplication.shared.openURL(url! as URL)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let currentCell = tableView.indexPath(for: self.rateOnTheAppstore),
            currentCell == indexPath {
            UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/fr/app/TransTracker/id1363793132?mt=8")! as URL)
        }
        if let currentCell = tableView.indexPath(for: self.sendComment),
            currentCell == indexPath {
            sendMailComment()
        }
        if let currentCell = tableView.indexPath(for: self.followOnTwitter),
            currentCell == indexPath {
            UIApplication.shared.openURL(NSURL(string: "https://twitter.com/AppTransTracker")! as URL)
        }
        if let currentCell = tableView.indexPath(for: self.viewOnGithub),
            currentCell == indexPath {
            UIApplication.shared.openURL(NSURL(string: "https://github.com/AliceDiNunno/TransTracker")! as URL)
        }
    }
}
