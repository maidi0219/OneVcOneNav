//
//  AppDelegate.m
//  NavBar
//
//  Created by LXL on 2017/8/19.
//  Copyright © 2017年 com.cnit. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "TabBarViewController.h"
#import "RTRootNavigationController.h"

#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    OneViewController *onv = [[OneViewController alloc]init];
    onv.title = @"one Vc";
    onv.tabBarItem.image = [UIImage imageNamed:@"home_normal"];
    UIImage *selectedImage = [[UIImage imageNamed:@"home_pressed"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    onv.tabBarItem.selectedImage = selectedImage;
    RTRootNavigationController *nav1 = [[RTRootNavigationController alloc]initWithRootViewController:onv];
    
    TwoViewController *two = [[TwoViewController alloc]init];
    two.title = @"Two Vc";
    two.tabBarItem.image = [UIImage imageNamed:@"report_normal"];
    UIImage *selectedImage2 = [[UIImage imageNamed:@"report_pressed"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    two.tabBarItem.selectedImage = selectedImage2;
    RTRootNavigationController *nav2 = [[RTRootNavigationController alloc]initWithRootViewController:two];

    
    TabBarViewController *tab = [[TabBarViewController alloc] init];
    [tab setViewControllers:[NSMutableArray arrayWithObjects:nav1, nav2, nil]];
    tab.view.frame = CGRectMake(0, -20, SCREENWIDTH, SCREENHEIGHT);
    self.window.rootViewController = tab;

    
    
    return YES;
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
