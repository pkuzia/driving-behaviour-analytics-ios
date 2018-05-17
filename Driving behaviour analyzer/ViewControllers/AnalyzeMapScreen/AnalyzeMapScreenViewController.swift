//
//  AnalzyneMapScreenViewController.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 17.05.2018.
//Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit
import GoogleMaps

class AnalyzeMapScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mapView: GMSMapView!

    let analyzeMapScreenViewModel = AnalyzeMapScreenViewModel()
    
    // MARK: - View Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    // MARK: - Appearance
    
    func initUI() {
        initNavBar()
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        mapView.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
    }
    
    fileprivate func initNavBar() {
        title = analyzeMapScreenViewModel.screenTitle
        navigationController?.navigationBar.titleTextAttributes = StyleKit.navBarAttributes()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        let menuButton = UIButton(type: .custom)
        menuButton.setImage(UIImage(named: "menu"), for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        menuButton.addTarget(self, action: #selector(clickMenuButtonHandler), for: .touchUpInside)
        let leftItems = UIBarButtonItem(customView: menuButton)
        
        self.navigationItem.setLeftBarButtonItems([leftItems], animated: true)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // MARK: - User Interaction
    
    func clickMenuButtonHandler() {
        
    }
    
    // MARK: - Additional Helpers
    
}

// MARK: - AnalyzeMapScreenViewModelDelegate

extension AnalyzeMapScreenViewController: AnalyzeMapScreenViewModelDelegate {
    
}

