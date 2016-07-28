//
//  UIView+Animation.h
//  iOS-Category
//
//  Created by 庄BB的MacBook on 16/7/20.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)
@property(nonatomic,copy)void(^completeBlock)();

- (void) shakeAnimation;

- (void) springingAnimation;

- (void) trans180DegreeAnimation;

- (void) throwFrom:(CGPoint)start to:(CGPoint)end height:(CGFloat)height
          duration:(CGFloat)duration completedBlock:(void(^)())completedBlock;

- (void) praiseAnimation;
@end
