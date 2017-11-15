//
//  AppDelegate.m
//  RaveObjCDemo
//
//  Created by Olusegun Solaja on 26/09/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+HexString.h"
@import IQKeyboardManagerSwift;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self configureStyle];
    [[IQKeyboardManager sharedManager] setEnable:true];
    return YES;
}

- (void) configureStyle{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#3B3355"]];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}]
    ;
    /*
     UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white,NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15)];
     UINavigationBar.appearance().tintColor = UIColor.white // .white
     UINavigationBar.appearance().barTintColor = UIColor(hex: "#112378") // UIColor(hex: "#E76E15")
     
     UINavigationBar.appearance().isTranslucent = false
     UINavigationBar.appearance().shadowImage = UIImage()
     UINavigationBar.appearance().setBackgroundImage(UIImage(),for: .default)
     //#0559A3
     UITabBar.appearance().tintColor = UIColor(hex: "#112378")
     UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
     */
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
