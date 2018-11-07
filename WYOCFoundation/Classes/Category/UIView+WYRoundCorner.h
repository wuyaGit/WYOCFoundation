//
//  UIView+WYRoundCorner.h
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WYRoundCorner)

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;

/**
 *  设置整体圆角(整体布局)
 *
 *  @param cornerRadius    需要设置的圆角大小
 */
- (void)addRoundedCornersWithCornerRadius:(CGFloat)cornerRadius;

/**
 *  设置整体圆角(整体布局+边框)
 *
 *  @param cornerRadius     需要设置的圆角大小
 *  @param borderColor      边框颜色
 *  @param borderWidth      边框线条宽度
 */
- (void)addRoundedCornersWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

/**
 *  设置整体圆角(整体布局+虚线边框)
 *
 *  @param cornerRadius     需要设置的圆角大小
 *  @param borderColor      边框颜色
 *  @param borderWidth      边框线条宽度
 */
- (void)addDashedCornersWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
