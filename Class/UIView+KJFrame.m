//
//  UIView+KJFrame.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/6/29.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "UIView+KJFrame.h"

@implementation UIView (KJFrame)

- (CGFloat)kj_x {
    return self.frame.origin.x;
}
- (void)setKj_x:(CGFloat)kj_x {
    CGRect frame = self.frame;
    frame.origin.x = kj_x;
    self.frame = frame;
}
- (CGFloat)kj_y {
    return self.frame.origin.y;
}
- (void)setKj_y:(CGFloat)kj_y {
    CGRect frame = self.frame;
    frame.origin.y = kj_y;
    self.frame = frame;
}
- (CGFloat)kj_width {
    return self.frame.size.width;
}
- (void)setKj_width:(CGFloat)kj_width {
    CGRect frame = self.frame;
    frame.size.width = kj_width;
    self.frame = frame;
}
- (CGFloat)kj_height {
    return self.frame.size.height;
}
- (void)setKj_height:(CGFloat)kj_height {
    CGRect frame = self.frame;
    frame.size.height = kj_height;
    self.frame = frame;
}

- (CGFloat)kj_centerX {
    return self.center.x;
}
- (void)setKj_centerX:(CGFloat)kj_centerX {
    CGPoint center = self.center;
    center.x = kj_centerX;
    self.center = center;
}
- (CGFloat)kj_centerY {
    return self.center.y;
}
- (void)setKj_centerY:(CGFloat)kj_centerY {
    CGPoint center = self.center;
    center.y = kj_centerY;
    self.center = center;
}


@end
