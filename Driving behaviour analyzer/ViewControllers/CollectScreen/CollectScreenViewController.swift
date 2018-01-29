//
//  CollectScreenViewController.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 26.12.2017.
//Copyright © 2017 Pkuzia. All rights reserved.
//

import UIKit
import OBD2
import CoreLocation

class CollectScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var vehicleSpeedLabel: UILabel!
    @IBOutlet weak var engineLoad: UILabel!
    @IBOutlet weak var engineSpeed: UILabel!
    @IBOutlet weak var torque: UILabel!
    
    @IBOutlet weak var vehicleSpeedValue: UILabel!
    @IBOutlet weak var engineLoadValue: UILabel!
    @IBOutlet weak var engineSpeedValue: UILabel!
    @IBOutlet weak var torqueValue: UILabel!
    
    let collectScreenViewModel = CollectScreenViewModel()
    let locationManager = CLLocationManager()
    
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
        initOBDII()
        initUI()
    }
    
    // MARK: - Appearance
    
    func initUI() {
        initNavBar()
        initLocationManager()
        actionButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -65, 0)
        
        /* Labels */
        infoLabel.attributedText = StyleKit.attributedText(text: collectScreenViewModel.connectionStateNotConnected,
                                                           attribute: .collectStateLabel)
        engineLoad.attributedText = StyleKit.attributedText(text: collectScreenViewModel.engineLoadLabel,
                                                            attribute: .collectParameterLabel)
        engineSpeed.attributedText = StyleKit.attributedText(text: collectScreenViewModel.engineSpeedLabel,
                                                             attribute: .collectParameterLabel)
        torque.attributedText = StyleKit.attributedText(text: collectScreenViewModel.fuelRailPressureLabel, attribute: .collectParameterLabel)
        vehicleSpeedLabel.attributedText = StyleKit.attributedText(text: collectScreenViewModel.vehicleSpeedLabel,
                                                                   attribute: .collectParameterLabel)
        
        engineLoadValue.attributedText = StyleKit.attributedText(text: collectScreenViewModel.emptyValuePlaceholder,
                                                                 attribute: .collectParameterLabel)
        engineSpeedValue.attributedText = StyleKit.attributedText(text: collectScreenViewModel.emptyValuePlaceholder,
                                                                  attribute: .collectParameterLabel)
        torqueValue.attributedText = StyleKit.attributedText(text: collectScreenViewModel.emptyValuePlaceholder,
                                                             attribute: .collectParameterLabel)
        vehicleSpeedValue.attributedText = StyleKit.attributedText(text: collectScreenViewModel.emptyValuePlaceholder,
                                                                   attribute: .collectParameterLabel)
    }
    
    fileprivate func initLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    fileprivate func initNavBar() {
        title = collectScreenViewModel.screenTitle
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
    }
    
    // MARK: - User Interaction
    
    @IBAction func clickActionButtonHandler(_ sender: Any) {
        switch collectScreenViewModel.connectionState {
        case .notConnected:
            collectScreenViewModel.obdIIService.connectOBD()
        case .connected:
            collectScreenViewModel.obdIIService.requestParameters()
        }
    }
    
    func clickMenuButtonHandler() {
        
    }
    // MARK: - Additional Helpers
    
    func initOBDII() {
        collectScreenViewModel.obdIIService.obdIIServiceDelegate = self
        collectScreenViewModel.obdIIService.initOBD()
    }
}

// MARK: - CollectScreenViewControllerViewModelDelegate

extension CollectScreenViewController: CollectScreenViewModelDelegate {
    
}

extension CollectScreenViewController: OBDIIServiceDelegate {
    func stateChanged(state: ScanState) {
        switch state {
        case .none:
            infoLabel.attributedText = StyleKit.attributedText(text: collectScreenViewModel.connectionStateNotConnected,
                                                               attribute: .collectStateLabel)
            break
        case .connected:
            infoLabel.attributedText = StyleKit.attributedText(text: collectScreenViewModel.connectionStateConnected,
                                                               attribute: .collectStateLabel)
            collectScreenViewModel.connectionState = .connected
            break
        case .openingConnection:
            infoLabel.attributedText = StyleKit.attributedText(text: collectScreenViewModel.connectionStateOpeningConnection,
                                                               attribute: .collectStateLabel)
            break
        case .initializing:
            infoLabel.attributedText = StyleKit.attributedText(text: collectScreenViewModel.connectionStateInit,
                                                               attribute: .collectStateLabel)
            break
        }
    }
    func valueRecieved(type: DataType, value: String) {
        DispatchQueue.main.async {
            switch type {
            case .engineLoad:
                self.engineLoadValue.attributedText = StyleKit.attributedText(text: value, attribute: .collectParameterLabel)
            case .engineSpeed:
                self.engineSpeedValue.attributedText = StyleKit.attributedText(text: value, attribute: .collectParameterLabel)
            case .vehicleSpeed:
                self.vehicleSpeedValue.attributedText = StyleKit.attributedText(text: value, attribute: .collectParameterLabel)
            case .fuelRailPressure:
                self.torqueValue.attributedText = StyleKit.attributedText(text: value, attribute: .collectParameterLabel)
            default:
                break
            }
        }
    }
}

// MARK: - CLLocationManagerDelegate

extension CollectScreenViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.item(at: 0)?.coordinate {
            collectScreenViewModel.userCurrentCoordinates = coordinate
        }
    }
}

