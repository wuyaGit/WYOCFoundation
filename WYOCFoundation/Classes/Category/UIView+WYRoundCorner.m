//
//  UIView+WYRoundCorner.m
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import "UIView+WYRoundCorner.h"

@implementation UIView (WYRoundCorner)

#pragma mark - 设置部分圆角

/// 设置部分圆角(绝对布局)
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

/// 设置部分圆角(相对布局)
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

/// 设置整体圆角(整体布局)
- (void)addRoundedCornersWithCornerRadius:(CGFloat)cornerRadius {
    if (self.layer.mask.frame.size.height != self.bounds.size.height) {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];    //圆角
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        //设置大小
        maskLayer.frame = self.bounds;
        //设置图形样子
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
}

/// 设置整体圆角(整体布局+边框)
- (void)addRoundedCornersWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    if (self.layer.mask.frame.size.height != self.bounds.size.height) {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = self.bounds;
        
        CAShapeLayer *borderLayer = [CAShapeLayer layer];
        borderLayer.frame = self.bounds;
        borderLayer.lineWidth = borderWidth+1.0;
        borderLayer.strokeColor = borderColor.CGColor;
        borderLayer.fillColor = [UIColor clearColor].CGColor;
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
        maskLayer.path = bezierPath.CGPath;
        borderLayer.path = bezierPath.CGPath;
        
        [self.layer insertSublayer:borderLayer atIndex:0];
        self.layer.mask = maskLayer;
    }
}

/// 设置整体圆角(整体布局+虚线边框)
- (void)addDashedCornersWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    if (self.layer.mask.frame.size.height != self.bounds.size.height) {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = self.bounds;
        
        CAShapeLayer *borderLayer = [CAShapeLayer layer];
        borderLayer.frame = self.bounds;
        borderLayer.lineWidth = borderWidth+1.0;
        borderLayer.strokeColor = borderColor.CGColor;
        borderLayer.fillColor = [UIColor clearColor].CGColor;
        borderLayer.lineDashPattern = @[@4, @2]; //虚线的间隔
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
        maskLayer.path = bezierPath.CGPath;
        borderLayer.path = bezierPath.CGPath;
        
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
        
        [self.layer insertSublayer:borderLayer atIndex:0];
        self.layer.mask = maskLayer;
    }
}

@end
