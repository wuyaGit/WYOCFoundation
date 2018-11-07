//
//  UIControl+WYClickBlock.h
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (WYClickBlock)

/**
 * 点击属性block
 */
//@property(nonatomic, copy)void (^touchUpInsideBlock)(void);
//@property(nonatomic, copy)void (^touchUpOutsideBlock)(void);
//
//@property(nonatomic, copy)void (^touchDragInsideBlock)(void);
//@property(nonatomic, copy)void (^touchDragOutsideBlock)(void);
//@property(nonatomic, copy)void (^touchDragEnterBlock)(void);
//@property(nonatomic, copy)void (^touchDragExitBlock)(void);
//
//@property(nonatomic, copy)void (^touchDownBlock)(void);
//@property(nonatomic, copy)void (^touchCancelBlock)(void);
//@property(nonatomic, copy)void (^valueChangedBlock)(void);
//
//@property(nonatomic, copy)void (^editingDidBeginBlock)(void);
//@property(nonatomic, copy)void (^editingChangedBlock)(void);
//@property(nonatomic, copy)void (^editingDidEndBlock)(void);
//@property(nonatomic, copy)void (^editingDidEndOnExitBlock)(void);

- (void)touchDown:(void (^)(void))eventBlock;

- (void)touchDownRepeat:(void (^)(void))eventBlock;

- (void)touchDragInside:(void (^)(void))eventBlock;

- (void)touchDragOutside:(void (^)(void))eventBlock;

- (void)touchDragEnter:(void (^)(void))eventBlock;

- (void)touchDragExit:(void (^)(void))eventBlock;

- (void)touchUpInside:(void (^)(void))eventBlock;

- (void)touchUpOutside:(void (^)(void))eventBlock;

- (void)touchCancel:(void (^)(void))eventBlock;

- (void)valueChanged:(void (^)(void))eventBlock;

- (void)editingDidBegin:(void (^)(void))eventBlock;

- (void)editingChanged:(void (^)(void))eventBlock;

- (void)editingDidEnd:(void (^)(void))eventBlock;

- (void)editingDidEndOnExit:(void (^)(void))eventBlock;


@end

NS_ASSUME_NONNULL_END
