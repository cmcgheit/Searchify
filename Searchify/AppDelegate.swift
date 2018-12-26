//
//  AppDelegate.swift
//  Searchify
//
//  Created by C McGhee on 5/3/17.
//  Copyright © 2017 Fam Design. All rights reserved.
//

import UIKit
import CoreData
import ChameleonFramework
// import CloudrailSI


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // CRCloudRail.setAppKey(kCloudRailAPIKey)
        
        Chameleon.setGlobalThemeUsingPrimaryColor(.flatBlack,
                                                  withSecondaryColor: .flatTeal,
                                                  andContentStyle: .contrast)
        
        // MARK: - Custom Navigation bar
       UINavigationBar.appearance().barTintColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
        
        // MARK: - Change status bar from dark to light(white)
        UIApplication.shared.statusBarStyle = .lightContent
        
        // MARK: - Get access to the status bar to change the color of its background to black
        let statusBar = UIApplication.shared.value(forKey: "statusBar") as! UIView
        
        statusBar.backgroundColor = .black
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
   
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
   
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
        self.saveContext()
    }
    // MARK: Open URL Function for CloudRail
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if (sourceApplication == "com.apple.SafariViewService") {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "kCloseSafariViewControllerNotification"), object: url)
            return true
        }
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Searchify")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

