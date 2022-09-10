//
//  ViewController.swift
//  hw2-ui-components
//
//  Created by Aynur Asadova on 2022-08-29.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainColor")
        setupTabBarController()
    }

    func setupTabBarController() {
        delegate = self
        
        let homeTabBarItem = UITabBarItem(title: "", image: UIImage(named: "home-not-active-icon"), selectedImage: UIImage(named: "home-active-icon"))
        
        let eventsTabBarItem = UITabBarItem(title: "", image: UIImage(named: "events-not-active-icon"), selectedImage: UIImage(named: "events-active-icon"))
        
        let calendarTabBarItem = UITabBarItem(title: "", image: UIImage(named: "calendar-not-active-icon"), selectedImage: UIImage(named: "calendar-active-icon"))
        
        let homeVC = HomeController()
        let eventsVC = EventsController()
        let scheduleVC = ScheduleController()
        
        homeVC.tabBarItem = homeTabBarItem
        eventsVC.tabBarItem = eventsTabBarItem
        scheduleVC.tabBarItem = calendarTabBarItem
        
        let viewControllers = [
            homeVC,
            eventsVC,
            scheduleVC
        ]
        
        self.viewControllers = viewControllers
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
    }
}

