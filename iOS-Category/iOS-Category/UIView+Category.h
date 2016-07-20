//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (MotionEffect)

- (void) addCenterMotionEffectsXYWithOffset:(CGFloat)offset;

@end




@interface UIView (Window)

- (void) addToWindow;

@end

@interface UIView (Screenshot)
- (UIImage*) screenshot;
- (UIImage*) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;
- (UIImage*) screenshotInFrame:(CGRect)frame;
@end




