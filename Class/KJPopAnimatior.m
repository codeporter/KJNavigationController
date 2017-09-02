//
//  KJPopAnimatior.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/6/29.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "KJPopAnimatior.h"

#import "UIView+KJFrame.h"
#import "UIViewController+KJNavigationBar.h"
#import "UINavigationBar+KJAddition.h"


static CGFloat kTransitionDuration = 0.25;

@interface KJPopAnimatior ()<CAAnimationDelegate>

@end

@implementation KJPopAnimatior

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return kTransitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController  *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    UIView *containerView = [transitionContext containerView];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.kj_x = -100;
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    fromView.layer.shadowRadius = 8;
    fromView.layer.shadowColor = [UIColor blackColor].CGColor;
    fromView.layer.shadowOpacity = 0.5;
    
    UIView *maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.15];
    
    
    [containerView addSubview:toView];
    [containerView addSubview:maskView];
    [containerView addSubview:fromView];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    animation.duration = kTransitionDuration;
    animation.removedOnCompletion = YES;
    animation.toValue = @0;
    animation.delegate = self;
    [fromView.layer addAnimation:animation forKey:nil];
    
    UINavigationBar *navigationBar = toVC.navigationController.navigationBar;
    [navigationBar kj_setBackgroundColor:fromVC.kj_navigationBarTintColor];
    [navigationBar kj_setNavigationBarAlpha:fromVC.kj_navigationBarAlpha];
    [navigationBar kj_setNavigationTitleColor:fromVC.kj_navigationTitleColor];

    
    [UIView animateWithDuration:kTransitionDuration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toView.kj_x = 0;
        fromView.kj_x = [UIScreen mainScreen].bounds.size.width;
        maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        
        [navigationBar kj_setBackgroundColor:toVC.kj_navigationBarTintColor];
        [navigationBar kj_setNavigationBarAlpha:toVC.kj_navigationBarAlpha];
        [navigationBar kj_setNavigationTitleColor:toVC.kj_navigationTitleColor];
        
    } completion:^(BOOL finished) {
        [maskView removeFromSuperview];
        fromView.layer.shadowOpacity = 0;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}



@end
