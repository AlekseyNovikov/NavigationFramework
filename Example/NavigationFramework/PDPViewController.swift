//
//  PDPViewController.swift
//  Navigation
//
//  Created by Alexey Novikov on 16/06/2017.
//  Copyright © 2017 Lazada Group. All rights reserved.
//

import UIKit
import NavigationFramework


class PDPViewController: UIViewController {

    var viewModel: PDPViewModel?

    var router: PDPRouter! {
        didSet {
            router.sourceViewConroller = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print((viewModel?.pdpInput?.interfaceFrom)! + "!!!!")
        ///Log Input
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToReviews(_ sender: UIButton) {
        router.goToReviews(withPaparams: viewModel!.reviewsParams)
    }
    

}


