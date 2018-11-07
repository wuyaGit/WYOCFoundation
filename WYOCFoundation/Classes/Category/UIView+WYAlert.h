//
//  UIView+WYAlert.h
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Alert <NSObject>

- (void)showHUD;
- (void)showHUDWithText:(NSString *)text;
- (void)hideHUD;

- (void)showToastWithText:(nullable NSString *)toastString;
- (void)showToastWithText:(nullable NSString *)toastString positon:(id)positon;
- (void)showToastWithText:(nullable NSString *)toastString duration:(NSTimeInterval)duration;
- (void)showToastWithText:(nullable NSString *)toastString duration:(NSTimeInterval)duration completion:(void(^)(BOOL didTap))completion;
- (void)showToastWithText:(nullable NSString *)toastString afterDelay:(NSTimeInterval)timeInterval;

- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmHandler:(void(^)(UIAlertAction *confirmAction))handler;
- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmTitle:(nullable NSString *)confirmTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler;
- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message singleConfirmTitle:(nullable NSString *)confirmTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler;
- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelAction:(nullable UIAlertAction *)cancelAction confirmAction:(nullable UIAlertAction *)confirmAction;

@end

@interface UIView (WYAlert)<Alert>

@end

@interface UIViewController (WYAlert)<Alert>

@end

NS_ASSUME_NONNULL_END
