//
//  UINavigationBar+KJAddition.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/7/3.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "UINavigationBar+KJAddition.h"

#import <objc/runtime.h>

@implementation UINavigationBar (KJAddition)

- (void)kj_setNavigationTitleColor:(UIColor *)color {
    NSMutableDictionary *attributes = self.titleTextAttributes.mutableCopy;
    if (attributes == nil) {
        attributes = @{}.mutableCopy;
    }
    [attributes setObject:color forKey:NSForegroundColorAttributeName];
    self.titleTextAttributes = attributes;
}

- (void)kj_setNavigationBarAlpha:(CGFloat)alpha {
    [self setBarBackgroundClear];
    self.backgroundView.alpha = alpha;
}

- (void)kj_setBackgroundColor:(UIColor *)color {
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.backgroundView.backgroundColor = color;
}


- (void)setBarBackgroundClear {
    
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            v.backgroundColor = [UIColor clearColor];
            
            return;
        }
    }

}

- (UIView *)backgroundView
{
    UIView *backgroundView = objc_getAssociatedObject(self, _cmd);
    if (!backgroundView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight(self.bounds) + 20)];
        backgroundView.userInteractionEnabled = NO;
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self.subviews.firstObject insertSubview:backgroundView atIndex:0];
        [self setBackgroundView:backgroundView];
    }
    self.backgroundColor = [UIColor clearColor];
    return backgroundView;
}
- (void)setBackgroundView:(UIView *)maskLayer
{
    objc_setAssociatedObject(self, @selector(backgroundView), maskLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
