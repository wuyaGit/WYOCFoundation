//
//  UIButton+WYExtension.h
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^WYCompletionBlock)(void);

typedef NS_ENUM(NSUInteger, WYButtonType) {
    WYButtonTypeLine,
    WYButtonTypeBG,
    WYButtonTypeCancel,
    WYButtonTypeDefault
};

typedef NS_ENUM(NSInteger, WYImagePosition) {
    WYImagePositionLeft     = 0,            //图片在左，文字在右，默认
    WYImagePositionRight    = 1,            //图片在右，文字在左
    WYImagePositionTop      = 2,            //图片在上，文字在下
    WYImagePositionBottom   = 3,            //图片在下，文字在上
};

@interface UIButton (WYExtension)

#pragma mark - 倒计时
/** 倒计时，s倒计 */
- (void)WY_countdownWithSec:(NSInteger)time;
/** 倒计时，秒字倒计 */
- (void)WY_countdownWithSecond:(NSInteger)second;
/** 倒计时，s倒计,带有回调 */
- (void)WY_countdownWithSec:(NSInteger)sec completion:(WYCompletionBlock)block;
/** 倒计时,秒字倒计，带有回调 */
- (void)WY_countdownWithSecond:(NSInteger)second completion:(WYCompletionBlock)block;

#pragma mark - 样式

- (instancetype)initWithType:(WYButtonType)buttonTYpe normalTitle:(NSString *)normalTitle titleFont:(CGFloat)titleFont cornerRadius:(NSInteger)cornerRadius;

- (void)setImagePosition:(WYImagePosition)postion spacing:(CGFloat)spacing;

/**根据图文距边框的距离调整图文间距*/
- (void)setImagePosition:(WYImagePosition)postion WithMargin:(CGFloat)margin;

@end

NS_ASSUME_NONNULL_END
