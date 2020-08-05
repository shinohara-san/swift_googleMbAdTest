//
//  ViewController.swift
//  AdTest
//
//  Created by Yuki Shinohara on 2020/08/05.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//  https://www.youtube.com/watch?v=xR161u8dwJ0

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    struct Constants {
        static let homeAdId = "ca-app-pub-3940256099942544/4411468910" //テスト用id

    }
    
    private var interstitialAd: GADInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interstitialAd = createAd()
        
        // Do any additional setup after loading the view.
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 55))
        btn.backgroundColor = .blue
        btn.center = view.center
        btn.setTitle("Show Ad", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
    }
    
    @objc private func didTapBtn(){
        print("タップ")
        if interstitialAd?.isReady == true {
            print("レディー")
            interstitialAd?.present(fromRootViewController: self)
        }
    }
    
    private func createAd() -> GADInterstitial {
        print("creating interstitial ad")
        let ad = GADInterstitial(adUnitID: Constants.homeAdId)
        ad.delegate = self
        ad.load(GADRequest())
        return ad
    }

}

extension ViewController: GADInterstitialDelegate {
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("creating interstitial ad")
        interstitialAd = createAd()
    }
}
