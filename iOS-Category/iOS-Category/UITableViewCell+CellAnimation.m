//
//  UITableViewCell+CellAnimation.m
//  xyc-ios
//
//  Created by peikua on 16/1/19.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "UITableViewCell+CellAnimation.h"

@implementation UITableViewCell (CellAnimation)

-(void)extendAnimation
{
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.25 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
-(void)shutterAnimation
{
     self.layer.transform = CATransform3DMakeScale(1, 0.1, 0.1);
    [UIView animateWithDuration:0.35 animations:^{

        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

-(void)graduatedAnimation
{
    self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    self.alpha = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.alpha = 1.0;
    }];
}
@end
