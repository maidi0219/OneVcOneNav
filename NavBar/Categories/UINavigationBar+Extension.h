//
//  UINavigationController+Extension.h
//  NavBar
//
//  Created by LXL on 2017/8/19.
//  Copyright © 2017年 com.cnit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDNavigation_objc_internal.h"



@interface UINavigationBar (Extension)<KDExtensionBarProtocol>

/**
 *  设置NavigationBar 透明度
 *
 */
- (void)setKD_navigationBarBackgroundAlpha:(CGFloat)navigationBarBackgroundAlpha;




@end
