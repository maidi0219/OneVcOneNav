//
//  UIViewController+Extension.h
//  NavBar
//
//  Created by LXL on 2017/8/19.
//  Copyright © 2017年 com.cnit. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    KDNavigationStyleNormal = 0,        // 白底蓝字
    KDNavigationStyleBlue,              // 蓝底白字
    KDNavigationStyleYellow,            // 黄底白字
    KDNavigationStyleClear,             // 透明底白字
    KDNavigationStyleCustom             // 自定义颜色
} KDNavigationStyle;


@interface UIViewController (Extension)
/**
 *  设置barTitle & item 样式
 *
 *  @param style style可扩展
 */
- (void)setNavigationStyle:(KDNavigationStyle)style;

/**
 *  设置bar颜色
 *
 */
- (void)setNavigationCustomStyleWithColorStr:(NSString *)colorStr;

/**
 *  设置bar颜色
 *
 */
- (void)setNavigationCustomStyleWithColor:(UIColor *)color;


@end
