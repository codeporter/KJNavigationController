//
//  UINavigationBar+KJAddition.h
//  KJNavigationController
//
//  Created by kejunapple on 2017/7/3.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (KJAddition)

- (void)kj_setBackgroundColor:(UIColor *)color;

- (void)kj_setNavigationBarAlpha:(CGFloat)alpha;

- (void)kj_setNavigationTitleColor:(UIColor *)color;
@end
