//
//  ViewController.swift
//  Interstitial
//
//  Created by David Leonard on 6/11/15.
//  Copyright (c) 2015 David Leonard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FlurryAdInterstitialDelegate {

    let adInterstitial = FlurryAdInterstitial(space: "fullswifty");
    let adTargeting = FlurryAdTargeting();
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        adInterstitial.adDelegate = self;
        adTargeting.testAdsEnabled = true;
        adInterstitial.targeting = adTargeting;
        adInterstitial.fetchAd();
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showFullScreenAdClickedButton(sender: AnyObject) {
        println("Clicked Button");
        if adInterstitial != nil && adInterstitial.ready {
            println("Ready to display ad");
            adInterstitial.presentWithViewController(self);
        } else {
            adInterstitial.fetchAd();
        }

    }
}

