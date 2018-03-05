//
//  CartViewController.swift
//  Navigation
//
//  Created by Alexey Novikov on 16/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import UIKit
import NavigationFramework

class CartViewController: UIViewController {
    var viewModel: CartViewModel!
    
    var router: CartRouter! {
        didSet {
            router.sourceViewConroller = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToPDP(_ sender: Any) {
        router.goToPDP(withParams: viewModel.pdpParams)
    }
    
    @IBAction func goToReviews(_ sender: UIButton) {
        router.goToReviews(withParams: viewModel.reviewsParams)
    }
    
    @IBAction func goToModalReviews(_ sender: UIButton) {
        router.goToModalReviews(withParams: viewModel.modalReviewsParams)
    }
    
}
