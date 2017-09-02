
//
//  UIViewController+KJNavigationBar.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/6/30.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "UIViewController+KJNavigationBar.h"
#import "UINavigationBar+KJAddition.h"
@import ObjectiveC;

@implementation UIViewController (KJNavigationBar)

- (CGFloat)kj_navigationBarAlpha {
    NSNumber *alphaNumber = objc_getAssociatedObject(self, @selector(kj_navigationBarAlpha));
    return alphaNumber ? alphaNumber.floatValue : 1.0;
}
- (void)setKj_navigationBarAlpha:(CGFloat)kj_navigationBarAlpha {
    objc_setAssociatedObject(self, @selector(kj_navigationBarAlpha), @(kj_navigationBarAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController.navigationBar kj_setNavigationBarAlpha:kj_navigationBarAlpha];

}

- (UIColor *)kj_navigationBarTintColor {
    UIColor *color = objc_getAssociatedObject(self, @selector(kj_navigationBarTintColor));
    if (color == nil) {
        color = [UIColor whiteColor];
    }
    return color;
}
- (void)setKj_navigationBarTintColor:(UIColor *)kj_navigationBarTintColor {
    objc_setAssociatedObject(self, @selector(kj_navigationBarTintColor), kj_navigationBarTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController.navigationBar kj_setBackgroundColor:kj_navigationBarTintColor];
}

- (UIColor *)kj_navigationTitleColor {
    UIColor *color = objc_getAssociatedObject(self, @selector(kj_navigationTitleColor));
    if (color == nil) {
        color = [UIColor blackColor];
    }
    return color;
}
- (void)setKj_navigationTitleColor:(UIColor *)kj_navigationTitleColor {
    objc_setAssociatedObject(self, @selector(kj_navigationTitleColor), kj_navigationTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController.navigationBar kj_setNavigationTitleColor:kj_navigationTitleColor];
}

@end
