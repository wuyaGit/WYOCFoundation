//
//  WYOCPreprocessConfiguration.m
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import "WYOCPreprocessConfiguration.h"
#import "WYOCConstants.h"
#import <Aspects/Aspects.h>

@interface WYOCPreprocessConfiguration ()

@end

@implementation WYOCPreprocessConfiguration

+ (void)load {
    [self init_setUIConfigure];
    [self init_setHookSelector];
}

#pragma mark - init
/**
 初始配置
 */
+ (void)init_setUIConfigure {
    //解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方法时,section间距大的问题
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight = 0;
    [UITableView appearance].estimatedSectionFooterHeight = 0;
    
    //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    }
    
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
                            stringByAppendingPathComponent:@"/WYOCFoundation.bundle/WYOCFoundation.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:@"component_left_back@3x.png"
                                inBundle:resource_bundle
           compatibleWithTraitCollection:nil];

    //全局设置
    if (@available(iOS 11.0, *)) {
        UIImage *backButtonImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [UINavigationBar appearance].backIndicatorImage = backButtonImage;
        [UINavigationBar appearance].backIndicatorTransitionMaskImage = backButtonImage;
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-250, 0) forBarMetrics:UIBarMetricsDefault];
    } else {
        UIImage *backButtonImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-WYOC_SCREEN_WIDTH, -WYOC_SCREEN_HEIGHT) forBarMetrics:UIBarMetricsDefault];
    }
    
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:UM_COLOR_MAIN_RED] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

/**
 放置钩子
 */
+ (void)init_setHookSelector {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        [UIViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//            if ([[NSStringFromClass([aspectInfo.instance class]) substringToIndex:2] isEqualToString:@"UM"]) {
//                UIViewController *vc = aspectInfo.instance;
//                vc.hidesBottomBarWhenPushed = YES;
//            }
//        } error:NULL];
//        [UIViewController aspect_hookSelector:@selector(viewDidDisappear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//            if ([[NSStringFromClass([aspectInfo.instance class]) substringToIndex:2] isEqualToString:@"UM"]) {
//                UIViewController *vc = aspectInfo.instance;
//
//                if (vc.navigationController.viewControllers.count > 1) {
//                    //                    [self hiddenTabBar];
//                }else {
//                    vc.hidesBottomBarWhenPushed = NO;
//                }
//            }
//        } error:NULL];
        
        [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionInstead usingBlock:(NSNumber*)^(id<AspectInfo> aspectInfo){
            UIViewController *vc = aspectInfo.instance;
            vc.edgesForExtendedLayout = UIRectEdgeNone;
            return @(UIInterfaceOrientationMaskAllButUpsideDown);
        } error:nil];
        [UIViewController aspect_hookSelector:@selector(shouldAutorotate) withOptions:AspectPositionInstead usingBlock:(NSNumber*)^(id<AspectInfo> aspectInfo){
            return @(NO);
        } error:nil];
        
    });
}

@end
