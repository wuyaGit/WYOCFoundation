//
//  WYOCCurrentViewController.h
//  WYOCFoundation
//
//  Created by hero on 2018/11/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYOCCurrentViewController : NSObject

@property (nonatomic, strong) UIViewController *getCurrentVC;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
