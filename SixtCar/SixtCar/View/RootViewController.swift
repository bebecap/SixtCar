//
//  ViewController.swift
//  SixtCar
//
//  Created by Volodymyr Grytsenko on 30.10.19.
//  Copyright © 2019 Volodymyr Grytsenko. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, StoryboardEmbeddedViewController, ViewModelDriven {
    typealias StoryboardEmbeddingViewController = UINavigationController
       
    typealias ViewModelType = RootViewModel
    var viewModel: ViewModelType!

    @IBOutlet private weak var representationSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var representationContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction
    private func segmentedControlValueChanged() {
        
    }
    
}

