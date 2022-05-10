//
//  ViewController.swift
//  AppodealTest
//
//  Created by Алексей Авдейчик on 10.05.22.
//

import UIKit
import Appodeal

class ViewController: UIViewController {
    
    var bannerCount = 0
    
    @IBOutlet weak var bannerTop: UIButton!
    @IBOutlet weak var interstitials: UIButton!
    @IBOutlet weak var rewardedVideo: UIButton!
    @IBOutlet weak var native: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerConfigure()
        interstitialsConfigure()
        rewardedVideoConfigure()
        
        view.backgroundColor = #colorLiteral(red: 0.3828683794, green: 0.3671541214, blue: 0.6710115075, alpha: 1)
        
    }
    
    private func bannerConfigure() {
        
        Appodeal.cacheAd(.banner)
        Appodeal.isReadyForShow(with: .bannerTop)
        Appodeal.setBannerDelegate(self)
        Appodeal.isInitalized(for: .banner)
        
    }
    
    private func interstitialsConfigure() {
        
        Appodeal.cacheAd(.interstitial)
        Appodeal.isReadyForShow(with: .interstitial)
        Appodeal.setInterstitialDelegate(self)
        Appodeal.isInitalized(for: .interstitial)
        Appodeal.predictedEcpm(for: .interstitial)
    }
    
    private func rewardedVideoConfigure() {
        
        Appodeal.cacheAd(.rewardedVideo)
        if Appodeal.isReadyForShow(with: .rewardedVideo) {
//            rewardedVideo.isEnabled = false
        }
  
        Appodeal.setRewardedVideoDelegate(self)
        Appodeal.isInitalized(for: .rewardedVideo)
        Appodeal.predictedEcpm(for: .rewardedVideo)
    }
    
    @IBAction func bannerTopButtonPressed(_ sender: UIButton) {
        
        
        Appodeal.showAd(.bannerTop, rootViewController: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            Appodeal.hideBanner()
            self.bannerCount += 1
        }
        
        if bannerCount == 4 {
            bannerTop.isHidden = true
        }
    }
    
    @IBAction func interstitialsButtonPressed(_ sender: UIButton) {
        
        Appodeal.showAd(.interstitial, rootViewController: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
            self.interstitials.isEnabled = true
        }
        
        interstitials.isEnabled = false
        
    }
    
    @IBAction func rewardedVideoButtonPressed(_ sender: UIButton) {
        Appodeal.showAd(.rewardedVideo, rootViewController: self)
    }
    
    @IBAction func nativeButtonPressed(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Native")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: AppodealBannerDelegate {
    
    func bannerDidLoadAdIsPrecache(_ precache: Bool) {}
    func bannerDidShow() {}
    func bannerDidFailToLoadAd() {}
    func bannerDidClick() {}
    func bannerDidExpired() {}
}

extension ViewController: AppodealInterstitialDelegate {

    func interstitialDidLoadAdIsPrecache(_ precache: Bool) {}
    func interstitialDidFailToLoadAd() {}
    func interstitialDidFailToPresent() {}
    func interstitialWillPresent() {}
    func interstitialDidDismiss() {}
    func interstitialDidClick() {}
    func interstitialDidExpired(){}
}

extension ViewController: AppodealRewardedVideoDelegate {

    func rewardedVideoDidLoadAdIsPrecache(_ precache: Bool) {}
    func rewardedVideoDidFailToLoadAd() {}
    func rewardedVideoDidFailToPresentWithError(_ error: Error) {}
    func rewardedVideoDidPresent() {}
    func rewardedVideoWillDismissAndWasFullyWatched(_ wasFullyWatched: Bool) {}
    func rewardedVideoDidFinish(_ rewardAmount: Float, name rewardName: String?) {}
    func rewardedVideoDidClick() {}
    func rewardedVideoDidExpired() {}
}


