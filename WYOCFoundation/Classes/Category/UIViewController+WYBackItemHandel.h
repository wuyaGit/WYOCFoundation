//
//  UIViewController+WYBackItemHandel.h
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BackItemHandlerProtocol <NSObject>
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
-(BOOL)navigationShouldPopOnBackButton;
@end

@interface UIViewController (WYBackItemHandel)<BackItemHandlerProtocol>

@end

NS_ASSUME_NONNULL_END
