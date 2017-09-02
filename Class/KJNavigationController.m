
//
//  KJNavigationController.m
//  KJNavigationController
//
//  Created by kejunapple on 2017/6/29.
//  Copyright © 2017年 kejunapple. All rights reserved.
//

#import "KJNavigationController.h"
#import "KJPushAnimator.h"
#import "KJPopAnimatior.h"
#import "UIViewController+KJNavigationBar.h"
#import "UINavigationBar+KJAddition.h"


@interface KJNavigationController ()<UINavigationControllerDelegate>

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactive;


@end

@implementation KJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.delegate = self;
    
    [self setupGesture];
}


#pragma mark - UINavigationControllerDelegate

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    
    
    return self.interactive;
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        
        return [KJPushAnimator new];
    } else if (operation == UINavigationControllerOperationPop) {
        return [KJPopAnimatior new];
    }
    
    return nil;
}

- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender {
    UIGestureRecognizerState state = sender.state;
    
    CGFloat offsetX = MAX(0, [sender translationInView:sender.view].x);
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat percent = offsetX / width;
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interactive  = [[UIPercentDrivenInteractiveTransition alloc] init];
            self.interactive.completionCurve = UIViewAnimationCurveLinear;
            [self popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            
            [self.interactive updateInteractiveTransition:percent];
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (percent > 0.5) {
                [self.interactive finishInteractiveTransition];
            } else {
                [self.interactive cancelInteractiveTransition];
            }
            
            self.interactive = nil;
        }
            break;
        default:
        {
            [self.interactive cancelInteractiveTransition];
            self.interactive = nil;
        }
            break;
    }
}

#pragma mark - pravite
- (void)setupGesture {
    
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    edgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePan];
    
}

@end



