//
//  UINavigationController+Extension.m
//  NavBar
//
//  Created by LXL on 2017/8/19.
//  Copyright © 2017年 com.cnit. All rights reserved.
//

#import "UINavigationBar+Extension.h"

@implementation UINavigationBar (Extension)

KDExtensionBarImplementation

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
            __instanceMethod_swizzling([self class], @selector(sizeThatFits:), @selector(kd_sizeThatFits:));
        }
    });
}


#pragma mark - Private Method
- (void)setKD_navigationBarBackgroundAlpha:(CGFloat)navigationBarBackgroundAlpha {
    [self.kd_backgroundView setAlpha:navigationBarBackgroundAlpha];
}

@end
