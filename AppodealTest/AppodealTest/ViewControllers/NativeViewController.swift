//
//  NativeViewController.swift
//  AppodealTest
//
//  Created by Алексей Авдейчик on 10.05.22.
//

import UIKit
import Appodeal


final class NativeViewController: UITableViewController {

    let nativeCellName  = "kASNativeCell"
    let nativePeriod    = 5
    
    
    private let adCache: NSMapTable <NSIndexPath, APDNativeAd> = NSMapTable.strongToStrongObjects()
    
    lazy var nativeAdQueue : APDNativeAdQueue = {
        return APDNativeAdQueue(sdk: nil,
                                settings: self.nativeAdSettings,
                                delegate: self,
                                autocache: true)
    }()
    
    var nativeAdSettings: APDNativeAdSettings! {
        get {
            let instance = APDNativeAdSettings()
            instance.adViewClass = NativeView.self
            return instance;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nativeAdQueue.loadAd()
    }
    
    func presentNative(onView view: UIView,
                       fromIndex index: NSIndexPath) {
        // Get ad from cache
        if let nativeAd = adCache.object(forKey: index) {
            nativeAd.show(on: view, controller: self)
            return
        }
        
        guard let nativeAd = nativeAdQueue.getNativeAds(ofCount: 1).first else { return }
        // Cache ads for correct viewability tracking
        adCache.setObject(nativeAd, forKey: index)
        nativeAd.show(on: view, controller: self)
    }
}


extension NativeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!

            cell = UITableViewCell(style: .default, reuseIdentifier: nativeCellName)
            presentNative(onView: cell.contentView, fromIndex: indexPath as NSIndexPath)


        return cell
    }
}


extension NativeViewController : APDNativeAdQueueDelegate {
    func adQueueAdIsAvailable(_ adQueue: APDNativeAdQueue, ofCount count: UInt) {}
    func adQueue(_ adQueue: APDNativeAdQueue, failedWithError error: Error) {}
}


private extension APDNativeAd {
    func show(on superview: UIView, controller: UIViewController) {
        getViewFor(controller).map {
            superview.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.leftAnchor.constraint(equalTo: superview.leftAnchor),
                $0.rightAnchor.constraint(equalTo: superview.rightAnchor),
                $0.topAnchor.constraint(equalTo: superview.topAnchor),
                $0.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
        }
    }
}
