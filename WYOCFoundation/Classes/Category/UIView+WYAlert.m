//
//  UIView+WYAlert.m
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import "UIView+WYAlert.h"
#import <objc/runtime.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Toast/Toast.h>

#import "WYOCConstants.h"

@implementation UIView (WYAlert)

#pragma mark - Alert

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmHandler:(void(^)(UIAlertAction *confirmAction))handler {
    [self showAlertWithTitle:title message:message confirmTitle:@"确定" confirmHandler:handler];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler {
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmlAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:handler];
    [self showAlertWithTitle:title message:message cancelAction:cancelAction confirmAction:confirmlAction];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message singleConfirmTitle:(NSString *)confirmTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler {
    
    UIAlertAction *confirmlAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:handler];
    [self showAlertWithTitle:title message:message cancelAction:nil confirmAction:confirmlAction];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelAction:(UIAlertAction *)cancelAction confirmAction:(UIAlertAction *)confirmAction {
    
    if (cancelAction == nil && confirmAction == nil) return;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (cancelAction) {
        [cancelAction setValue:WYOC_COLOR_HEX(0xAAAAAA) forKey:@"titleTextColor"];
        [alertController addAction:cancelAction];
    }
    if (confirmAction) {
        [confirmAction setValue:WYOC_COLOR_HEX(0x383838) forKey:@"titleTextColor"];
        [alertController addAction:confirmAction];
    }
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - HUD

static void *HUDKEY = &HUDKEY;
- (MBProgressHUD *)HUD {
    return objc_getAssociatedObject(self, HUDKEY);
}

- (void)setHUD:(MBProgressHUD *)HUD {
    objc_setAssociatedObject(self, HUDKEY, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHUD {
    [self showHUDWithText:@""];
}

- (void)showHUDWithText:(NSString *)text {
    MBProgressHUD *HUD = [self HUD];
    if (!HUD) {
        HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
        HUD.dimBackground = NO;
        HUD.removeFromSuperViewOnHide = YES;
        [self setHUD:HUD];
    }
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    HUD.label.text = text;
    [HUD showAnimated:YES];
}

- (void)hideHUD {
    [[self HUD] hideAnimated:YES];
}


#pragma mark - Toast

static void *ToastKEY = &ToastKEY;

- (UIView *)toastView {
    return objc_getAssociatedObject(self, ToastKEY);
}

- (void)setToastView:(UIView *)toastView {
    objc_setAssociatedObject(self, ToastKEY, toastView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showToastWithText:(NSString *)toastString {
    [self showToastWithText:toastString positon:CSToastPositionCenter];
}

- (void)showToastWithText:(NSString *)toastString positon:(id)positon {
    
    if (toastString.length > 0) {
        
        if (![self toastView]) {
            [CSToastManager setQueueEnabled:NO];
            [CSToastManager sharedStyle].backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
            [CSToastManager sharedStyle].verticalPadding = 20;
            [CSToastManager sharedStyle].horizontalPadding = 18;
        }
        
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        UIView *toastView = [keyWindow toastViewForMessage:toastString title:nil image:nil style:nil];
        [UIView animateWithDuration:0.3 animations:^{
            [self toastView].alpha = 0 ;
        } completion:^(BOOL finished) {
            [[self toastView] removeFromSuperview];
            [self setToastView:toastView];
        }];
        [keyWindow showToast:toastView duration:1.5 position:positon completion:nil];
    }
}

- (void)showToastWithText:(NSString *)toastString duration:(NSTimeInterval)duration  {
    
    if (toastString.length > 0) {
        
        if (![self toastView]) {
            [CSToastManager setQueueEnabled:NO];
            [CSToastManager sharedStyle].backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
            [CSToastManager sharedStyle].verticalPadding = 20;
            [CSToastManager sharedStyle].horizontalPadding = 18;
        }
        
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        UIView *toastView = [keyWindow toastViewForMessage:toastString title:nil image:nil style:nil];
        [UIView animateWithDuration:0.3 animations:^{
            [self toastView].alpha = 0 ;
        } completion:^(BOOL finished) {
            [[self toastView] removeFromSuperview];
            [self setToastView:toastView];
        }];
        [keyWindow showToast:toastView duration:duration position:CSToastPositionCenter completion:nil];
    }
}

- (void)showToastWithText:(NSString *)toastString duration:(NSTimeInterval)duration completion:(void(^)(BOOL didTap))completion {
    
    if (toastString.length > 0) {
        
        if (![self toastView]) {
            [CSToastManager setQueueEnabled:NO];
            [CSToastManager sharedStyle].backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
            [CSToastManager sharedStyle].verticalPadding = 20;
            [CSToastManager sharedStyle].horizontalPadding = 18;
        }
        
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        UIView *toastView = [keyWindow toastViewForMessage:toastString title:nil image:nil style:nil];
        [UIView animateWithDuration:0.3 animations:^{
            [self toastView].alpha = 0 ;
        } completion:^(BOOL finished) {
            [[self toastView] removeFromSuperview];
            [self setToastView:toastView];
        }];
        [keyWindow showToast:toastView duration:duration position:CSToastPositionCenter completion:completion];
    }
}

- (void)showToastWithText:(NSString *)toastString afterDelay:(NSTimeInterval)timeInterval {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showToastWithText:toastString];
    });
}

@end


@implementation UIViewController (WYAlert)

- (void)showHUD {
    [self.view showHUD];
}

- (void)showHUDWithText:(NSString *)text {
    [self.view showHUDWithText:text];
}

- (void)hideHUD {
    [self.view hideHUD];
}

- (void)showToastWithText:(NSString *)toastString {
    [self.view showToastWithText:toastString];
}

- (void)showToastWithText:(NSString *)toastString positon:(id)positon {
    [self.view showToastWithText:toastString positon:positon];
}

- (void)showToastWithText:(NSString *)toastString duration:(NSTimeInterval)duration {
    [self.view showToastWithText:toastString duration:duration];
}

- (void)showToastWithText:(NSString *)toastString duration:(NSTimeInterval)duration completion:(void(^)(BOOL didTap))completion {
    [self.view showToastWithText:toastString duration:duration completion:completion];
}

- (void)showToastWithText:(NSString *)toastString afterDelay:(NSTimeInterval)timeInterval {
    [self.view showToastWithText:toastString afterDelay:timeInterval];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmHandler:(void(^)(UIAlertAction *confirmAction))handler {
    [self.view showAlertWithTitle:title message:message confirmHandler:handler];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler {
    [self.view showAlertWithTitle:title message:message confirmTitle:confirmTitle confirmHandler:handler];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message singleConfirmTitle:(NSString *)confirmTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler {
    [self.view showAlertWithTitle:title message:message singleConfirmTitle:confirmTitle confirmHandler:handler];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelAction:(UIAlertAction *)cancelAction confirmAction:(UIAlertAction *)confirmAction {
    [self.view showAlertWithTitle:title message:message cancelAction:cancelAction confirmAction:confirmAction];
}

@end
