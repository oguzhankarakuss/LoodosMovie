//
//  SplashViewController.swift
//  LoodosMovie
//
//  Created by Oğuzhan Karakuş on 7.07.2019.
//  Copyright © 2019 Oğuzhan Karakuş. All rights reserved.
//

import UIKit
import Reachability
import FirebaseRemoteConfig
import RevealingSplashView

final class SplashViewController: UIViewController {
    
    @IBOutlet private weak var customView: SplashView!
    
    let remoteConfig = RemoteConfig.remoteConfig()
    let reachability = Reachability()!
    var revealingSplashView: RevealingSplashView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        checkNetworkConnection()
        fetchRC()
        
        //revealingSplashView.animationType = .twitter
    }
    
    func checkNetworkConnection(){
        DispatchQueue.main.asyncAfter(deadline:.now() + 3.0){
            if self.reachability.connection != .none {
                //TODO: open
                let iv = UIImageView()
                let icon = UIImage(named: "splash")?.withRenderingMode(.alwaysTemplate)
                iv.image = icon
                iv.tintColor = UIColor(hex: 0xFFFFFF, a: 0.8)
                self.revealingSplashView = RevealingSplashView(iconImage: iv.image!, iconInitialSize: CGSize(width: 170, height: 170), backgroundColor: .backgroundColor)
                self.view.addSubview(self.revealingSplashView!)
                self.revealingSplashView?.playTwitterAnimation {
                    self.revealingSplashView?.startAnimation()
                    let movieListViewController = MovieListBuilder.make()
                    self.show(movieListViewController, sender: nil)
                }
                
            } else {
                self.showNetworkError()
            }
            
        }
    }
    
    func showNetworkError(){
        let networkAlert = UIAlertController(title: "Please check your network connection!", message: nil, preferredStyle: .alert)
        networkAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(networkAlert, animated: true, completion: nil)
    }
    
    func updateWithRCValues(){
        let splashText = remoteConfig.configValue(forKey: "splashText").stringValue ?? ""
        customView.updateText(splashText)
    }
    
    //    func setupRCDefaults(){
    //        let defaultValues = ["splashText": "Loodos" as NSObject]
    //        remoteConfig.setDefaults(defaultValues)
    //    }
    func fetchRC(){
        let debugSetting = RemoteConfigSettings(developerModeEnabled: true)
        remoteConfig.configSettings = debugSetting
        
        remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
            guard error == nil else{
                print("Remote Config Error: \(error)")
                return
            }
            print("RC Success :)")
            self.remoteConfig.activateFetched()
            self.updateWithRCValues()
        }
    }
    
}
