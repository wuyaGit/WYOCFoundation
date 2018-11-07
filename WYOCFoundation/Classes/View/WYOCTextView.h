//
//  WYOCTextView.h
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYOCTextView : UIView

- (instancetype)initWithFrame:(CGRect)frame font:(CGFloat)font;

@property (strong, nonatomic) UITextView *textView;

@property (copy, nonatomic) NSString *text;
- (void)setText:(NSString *) text;

@end

NS_ASSUME_NONNULL_END
