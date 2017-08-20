//
//  TabBarViewController.m
//  NavBar
//
//  Created by LXL on 2017/8/19.
//  Copyright © 2017年 com.cnit. All rights reserved.
//

#import "TabBarViewController.h"
#import "UIColor+Extension.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabBarStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 设置tabBar样式
- (void)setupTabBarStyle{
    self.tabBar.barTintColor = [UIColor colorWithHex:0xffffff];;
    //UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[TabBarViewController class]]];
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedIn:[TabBarViewController class], nil];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor colorWithHex:0x1e93fa];
    [tabBarItem setTitleTextAttributes:attributes forState:UIControlStateSelected];
}

@end
