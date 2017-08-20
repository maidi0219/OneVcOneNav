//
//  UIViewController+Extension.m
//  NavBar
//
//  Created by LXL on 2017/8/19.
//  Copyright © 2017年 com.cnit. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>
#import "UINavigationBar+Extension.h"

@interface UIViewController()

@property (nonatomic, assign) KDNavigationStyle style;
@property (nonatomic, strong) UIColor *customColor;

@end


@implementation UIViewController (Extension)
#pragma mark - Method Swizzling
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        void (^__instanceMethod_swizzling)(Class, SEL, SEL) = ^(Class cls, SEL orgSEL, SEL swizzlingSEL){
            Method orgMethod = class_getInstanceMethod(cls, orgSEL);
            Method swizzlingMethod = class_getInstanceMethod(cls, swizzlingSEL);
            if (class_addMethod(cls, orgSEL, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod))) {
                
                class_replaceMethod(cls, orgSEL, method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
            }
            else
            {
                method_exchangeImplementations(orgMethod, swizzlingMethod);
            }
            
        };
        
        {
            __instanceMethod_swizzling([self class], @selector(viewDidLoad), @selector(___viewDidLoad));
        }
        {
            __instanceMethod_swizzling([self class], @selector(viewWillAppear:), @selector(___viewWillAppear:));
        }
    });
}

- (void)___viewDidLoad{
    [self ___viewDidLoad];
    [self setNavigationStyle:KDNavigationStyleNormal];
    if([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        if (self.navigationController) {
            [self.navigationController.navigationBar setTranslucent:NO];
        }
    }
}

- (void)___viewWillAppear:(BOOL)animated {
    
    
    [self ___viewWillAppear:animated];
    [self setNavigationStyle:self.style];
}


#pragma mark - Navigation Style

- (void)setNavigationStyle:(KDNavigationStyle)style {
    
    self.style = style;
    
    if ([NSStringFromClass([self class]) isEqualToString:@"_UIRemoteInputViewController"]
        || [self isKindOfClass:[UINavigationController class]]
        || [self isKindOfClass:NSClassFromString(@"UICompatibilityInputViewController")]) {
        return;
    }
    
    switch (style) {
        case KDNavigationStyleNormal:
        {
            [self.navigationController.navigationBar setBarTintColor:FC6];
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : FC1, NSFontAttributeName : FS1}];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC5, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC5, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC5, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC5, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
        }
            break;
        case KDNavigationStyleBlue:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self.navigationController.navigationBar setBarTintColor:FC5];
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS1}];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
        }
            break;
        case KDNavigationStyleYellow:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self.navigationController.navigationBar setBarTintColor:[UIColor kdNavYellowColor]];
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS1}];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
        }
            break;
        case KDNavigationStyleClear:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self.navigationController.navigationBar setTranslucent:YES];
            [self.navigationController.navigationBar setKD_navigationBarBackgroundAlpha:0.f];
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS1}];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
        }
            break;
        case KDNavigationStyleCustom:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [self.navigationController.navigationBar setBarTintColor:self.customColor];
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS1}];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateNormal];
            [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : FC6, NSFontAttributeName : FS3} forState:UIControlStateHighlighted];
        }
            break;
            
        default:
            break;
    }
}

- (void)setNavigationCustomStyleWithColorStr:(NSString *)colorStr {
    
    if (colorStr && colorStr.length == 7) {
        NSString *trueColor = [colorStr substringWithRange:NSMakeRange(1, colorStr.length - 1)];
        if (![[trueColor lowercaseString] isEqualToString:@"ffffff"]) {
            self.customColor = [UIColor colorWithHexRGB:trueColor];
            [self setNavigationStyle:KDNavigationStyleCustom];
        }
    }
}

- (void)setNavigationCustomStyleWithColor:(UIColor *)color {
    
    if (color && !CGColorEqualToColor(color.CGColor, FC6.CGColor)) {
        self.customColor = color;
        [self setNavigationStyle:KDNavigationStyleCustom];
    }
}

#pragma mark - setter && getter

- (KDNavigationStyle)style {
    
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setStyle:(KDNavigationStyle)style {
    
    objc_setAssociatedObject(self, @selector(style), @(style), OBJC_ASSOCIATION_ASSIGN);
}


- (UIColor *)customColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCustomColor:(UIColor *)customColor {
    objc_setAssociatedObject(self, @selector(customColor), customColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
