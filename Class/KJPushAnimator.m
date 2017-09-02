//
//  KJPushAnimator.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/6/29.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "KJPushAnimator.h"
#import "UIView+KJFrame.h"
#import "UIViewController+KJNavigationBar.h"
#import "UINavigationBar+KJAddition.h"

static CGFloat kTransitionDuration = 0.25;


@implementation KJPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return kTransitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.kj_x = [UIScreen mainScreen].bounds.size.width;
    
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    
    UINavigationBar *navigationBar = toVC.navigationController.navigationBar;
    
    [navigationBar kj_setBackgroundColor:fromVC.kj_navigationBarTintColor];
    [navigationBar kj_setNavigationBarAlpha:fromVC.kj_navigationBarAlpha];
    [navigationBar kj_setNavigationTitleColor:fromVC.kj_navigationTitleColor];
    
    [UIView animateWithDuration:kTransitionDuration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        fromView.kj_x = -100;
        toView.kj_x = 0;
        
        [navigationBar kj_setBackgroundColor:toVC.kj_navigationBarTintColor];
        [navigationBar kj_setNavigationBarAlpha:toVC.kj_navigationBarAlpha];
        [navigationBar kj_setNavigationTitleColor:toVC.kj_navigationTitleColor];
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        [navigationBar kj_setBackgroundColor:toVC.kj_navigationBarTintColor];
        [navigationBar kj_setNavigationBarAlpha:toVC.kj_navigationBarAlpha];
        [navigationBar kj_setNavigationTitleColor:toVC.kj_navigationTitleColor];
    }];
    
}


@end
