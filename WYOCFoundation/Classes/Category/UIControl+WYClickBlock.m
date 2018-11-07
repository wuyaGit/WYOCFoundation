//
//  UIControl+WYClickBlock.m
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import "UIControl+WYClickBlock.h"
#import <objc/runtime.h>

#define UIControlEventImpl(methodName, eventName)                                                                      \
-(void)methodName : (void (^)(void))eventBlock {                                                                     \
    objc_setAssociatedObject(self, @selector(methodName:), eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);           \
    [self addTarget:self action:@selector(methodName##Action:) forControlEvents:UIControlEvent##eventName];            \
}                                                                                                                    \
-(void)methodName##Action : (id)sender {                                                                             \
    void (^block)() = objc_getAssociatedObject(self, @selector(methodName:));                                                            \
    if (block) {                                                                                                       \
        block();                                                                                                         \
    }                                                                                                                  \
}

@implementation UIControl (WYClickBlock)

UIControlEventImpl(touchDown, TouchDown);
UIControlEventImpl(touchDownRepeat, TouchDownRepeat);
UIControlEventImpl(touchDragInside, TouchDragInside);
UIControlEventImpl(touchDragOutside, TouchDragOutside);
UIControlEventImpl(touchDragEnter, TouchDragEnter);
UIControlEventImpl(touchDragExit, TouchDragExit);
UIControlEventImpl(touchUpInside, TouchUpInside);
UIControlEventImpl(touchUpOutside, TouchUpOutside);
UIControlEventImpl(touchCancel, TouchCancel);
UIControlEventImpl(valueChanged, ValueChanged);
UIControlEventImpl(editingDidBegin, EditingDidBegin);
UIControlEventImpl(editingChanged, EditingChanged);
UIControlEventImpl(editingDidEnd, EditingDidEnd);
UIControlEventImpl(editingDidEndOnExit, EditingDidEndOnExit);

@end
