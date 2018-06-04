//
//  AnalzyneMapScreenViewController.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 17.05.2018.
//Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit
import GoogleMaps
import SwifterSwift

class AnalyzeMapScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var parametersView: ParametersView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    let analyzeMapScreenViewModel = AnalyzeMapScreenViewModel()
    var locationManager = CLLocationManager()
    
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
        initLocationManager()
    }

    // MARK: - Appearance
    
    func initUI() {
        initNavBar()
        parametersView.initView()
        actionButton.backgroundColor = StyleKit.colorType(color: .baseLightBlueColor)
        actionButton.cornerRadius = actionButton.frame.height / 2
        actionButton.setTitleForAllStates(analyzeMapScreenViewModel.connectButtonTitle)
        time.attributedText = StyleKit.attributedText(text: analyzeMapScreenViewModel.zeroTime, attribute: .analyzeTime)
        
        //Mock
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        mapView.camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
    }
    
    fileprivate func initLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
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
        menuButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        menuButton.addTarget(self, action: #selector(clickMenuButtonHandler), for: .touchUpInside)
        let leftItems = UIBarButtonItem(customView: menuButton)
        
        self.navigationItem.setLeftBarButtonItems([leftItems], animated: true)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // MARK: - User Interaction
    
    func clickMenuButtonHandler() {
        let storyboard = UIStoryboard(storyboard: .Menu)
        let menuScreenViewController: MenuScreenViewController = storyboard.instantiateViewController()
        self.present(menuScreenViewController, animated: true, completion: nil)
    }
    
    @IBAction func actionButtonClicked(_ sender: Any) {
        switch analyzeMapScreenViewModel.analyzeState {
        case .idle:
            analyzeMapScreenViewModel.analyzeState = .connected
            actionButton.setTitleForAllStates(analyzeMapScreenViewModel.startButtonTitle)
            actionButton.backgroundColor = StyleKit.colorType(color: .analyzeStartColor)
        case .connected:
            analyzeMapScreenViewModel.analyzeState = .drive
            actionButton.setTitleForAllStates(analyzeMapScreenViewModel.stopButtonTitle)
            actionButton.backgroundColor = StyleKit.colorType(color: .analyzeStopColor)
        case .drive:
            analyzeMapScreenViewModel.analyzeState = .stopped
            actionButton.setTitleForAllStates(analyzeMapScreenViewModel.startButtonTitle)
            actionButton.backgroundColor = StyleKit.colorType(color: .analyzeStartColor)
        case .stopped:
            analyzeMapScreenViewModel.analyzeState = .connected
            actionButton.setTitleForAllStates(analyzeMapScreenViewModel.startButtonTitle)
            actionButton.backgroundColor = StyleKit.colorType(color: .analyzeStartColor)
        }
    }
    
    // MARK: - Additional Helpers
    
}

// MARK: - AnalyzeMapScreenViewModelDelegate

extension AnalyzeMapScreenViewController: AnalyzeMapScreenViewModelDelegate {
    
}

extension AnalyzeMapScreenViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else {
            return
        }
        let camera = GMSCameraPosition.camera(withLatitude: userLocation.coordinate.latitude,
                                              longitude: userLocation.coordinate.longitude, zoom: 13.0)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        locationManager.stopUpdatingLocation()
    }
}
