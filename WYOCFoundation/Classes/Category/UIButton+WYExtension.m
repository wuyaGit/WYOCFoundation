//
//  UIButton+WYExtension.m
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import "UIButton+WYExtension.h"
#import "WYOCConstants.h"

@implementation UIButton (WYExtension)

/** 倒计时，s倒计 */
- (void)WY_countdownWithSec:(NSInteger)sec {
    __block NSInteger tempSecond = sec;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if (tempSecond <= 1) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = YES;
                
                [self.titleLabel setText:@"获取验证码"];
                [self setTitle:@"获取验证码" forState:UIControlStateNormal];
            });
        } else {
            tempSecond--;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = NO;
                
                NSString *secText = [NSString stringWithFormat:@"%ld", (long)tempSecond];
                [self.titleLabel setText:secText];
                [self setTitle:secText forState:UIControlStateNormal];
            });
        }
    });
    dispatch_resume(timer);
}

/** 倒计时，秒字倒计 */
- (void)WY_countdownWithSecond:(NSInteger)second {
    __block NSInteger tempSecond = second;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if (tempSecond <= 1) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = YES;
                
                [self.titleLabel setText:@"重新发送"];
                [self setTitle:@"重新发送" forState:UIControlStateNormal];
            });
        } else {
            tempSecond--;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = NO;
                
                NSString *secText = [NSString stringWithFormat:@"%ld 秒后重试", (long)tempSecond];
                [self.titleLabel setText:secText];
                [self setTitle:secText forState:UIControlStateNormal];
            });
        }
    });
    dispatch_resume(timer);
}

/** 倒计时，s倒计,带有回调 */
- (void)WY_countdownWithSec:(NSInteger)sec completion:(WYCompletionBlock)block {
    __block NSInteger tempSecond = sec;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if (tempSecond <= 1) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = YES;
                if (block) {
                    block();
                }
            });
        } else {
            tempSecond--;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = NO;
                
                NSString *secText = [NSString stringWithFormat:@"%ld", (long)tempSecond];
                [self.titleLabel setText:secText];
                [self setTitle:secText forState:UIControlStateNormal];
            });
        }
    });
    dispatch_resume(timer);
}

/** 倒计时,秒字倒计，带有回调 */
- (void)WY_countdownWithSecond:(NSInteger)second completion:(WYCompletionBlock)block {
    __block NSInteger tempSecond = second;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if (tempSecond <= 1) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = YES;
                if (block) {
                    block();
                }
            });
        } else {
            tempSecond--;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.enabled = NO;
                
                NSString *secText = [NSString stringWithFormat:@"%ld 秒后重试", (long)tempSecond];
                [self.titleLabel setText:secText];
                [self setTitle:secText forState:UIControlStateNormal];
            });
        }
    });
    dispatch_resume(timer);
}

#pragma mark - 样式

- (instancetype)initWithType:(WYButtonType)buttonTYpe normalTitle:(NSString *)normalTitle titleFont:(CGFloat)titleFont cornerRadius:(NSInteger)cornerRadius {
    if (self = [self init]) {
        [self setTitle:normalTitle forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
        self.layer.cornerRadius = cornerRadius;
        switch (buttonTYpe) {
                case WYButtonTypeLine:
            {
                [self setBackgroundColor:[UIColor whiteColor]];
                [self setTitleColor:WYOC_COLOR_HEX(0xCCCCCC) forState:UIControlStateDisabled];
                [self setTitleColor:WYOC_COLOR_HEX(0x66cc66) forState:UIControlStateNormal];
                if (self.enabled) {
                    self.layer.borderColor = WYOC_COLOR_HEX(0x66cc66).CGColor;
                    self.layer.borderWidth = 0.5;
                }else{
                    self.layer.borderColor = WYOC_COLOR_HEX(0xCCCCCC).CGColor;
                    self.layer.borderWidth = 0.5;
                }
            }
                break;
                case WYButtonTypeBG:
            {
                self.backgroundColor = WYOC_COLOR_HEX(0x66cc66);
                [self addTarget:self action:@selector(kzwbuttonBackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
                [self addTarget:self action:@selector(kzwbuttonBackGroundNormal:) forControlEvents:UIControlEventTouchUpInside];
                //            [button setBackgroundImage:[self imageWithColor:[[UIColor baseColor] colorWithAlphaComponent:0.3]] forState:UIControlStateDisabled];
            }
                break;
                case WYButtonTypeCancel:
            {
                [self setTitleColor:WYOC_COLOR_HEX(0x999999) forState:UIControlStateNormal];
                [self setTitleColor:WYOC_COLOR_HEX(0x999999) forState:UIControlStateDisabled];
                self.layer.borderColor = WYOC_COLOR_HEX(0x999999).CGColor;
                self.layer.borderWidth = 0.5;
                self.layer.masksToBounds = YES;
            }
                break;
                case WYButtonTypeDefault:
            {
                [self setBackgroundColor:[UIColor whiteColor]];
                [self setTitleColor:WYOC_COLOR_HEX(0x333333) forState:UIControlStateNormal];
            }
                break;
            default:
                break;
        }
    }
    return self;
}

- (void)setImagePosition:(WYImagePosition)postion spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    CGFloat labelWidth = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].height;
    
    //image中心移动的x距离
    CGFloat imageOffsetX = labelWidth / 2 ;
    //image中心移动的y距离
    CGFloat imageOffsetY = labelHeight / 2 + spacing / 2;
    //label中心移动的x距离
    CGFloat labelOffsetX = imageWith/2;
    //label中心移动的y距离
    CGFloat labelOffsetY = imageHeight / 2 + spacing / 2;
    
    switch (postion) {
            case WYImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
            case WYImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
            case WYImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
            case WYImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
}

- (void)setImagePosition:(WYImagePosition)postion WithMargin:(CGFloat)margin{
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat labelWidth = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
    CGFloat spacing = self.bounds.size.width - imageWith - labelWidth - 2*margin;
    
    [self setImagePosition:postion spacing:spacing];
}

#pragma mark - private

- (void)kzwbuttonBackGroundNormal:(UIButton *)sender
{
    sender.backgroundColor = WYOC_COLOR_HEX(0x66cc66);
}

//  button1高亮状态下的背景色
- (void)kzwbuttonBackGroundHighlighted:(UIButton *)sender
{
    sender.backgroundColor = WYOC_COLOR_HEX(0xe15e0e);
}


@end
