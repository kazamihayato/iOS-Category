//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Category)

+ (UIImage *) imageByScalingToMaxSize:(UIImage *)sourceImage;
+ (UIImage *) imageWithColor:(UIColor*)color;
+ (UIImage *) imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;

- (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage *) resizableImage:(UIEdgeInsets)insets;
- (UIImage *) imageWithColor:(UIColor *)color;
- (UIImage *) imageByResizeToScale:(CGFloat)scale;

- (UIImage *) imageByResizeWithMaxSize:(CGSize)size;

- (UIImage *) imageWithThumbnailForSize:(CGSize)size;

- (UIImage *) imageByCropToRect:(CGRect)rect;

- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius;
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius
                              corners:(UIRectCorner)corners
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor
                       borderLineJoin:(CGLineJoin)borderLineJoin;



- (UIImage *)imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;

- (UIImage *)imageByRotateLeft90;

- (UIImage *)imageByRotateRight90;


- (UIImage *)imageByRotate180;


- (UIImage *)imageByFlipVertical;


- (UIImage *)imageByFlipHorizontal;



@end


@interface UIImage (Blur)
- (UIImage *)imageByBlurSoft;

- (UIImage *)imageByBlurLight;


- (UIImage *)imageByBlurExtraLight;


- (UIImage *)imageByBlurDark;


- (UIImage *)imageByBlurWithTint:(UIColor *)tintColor;


- (UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage;

- (UIImage *) boxblurImageWithBlur:(CGFloat)blur exclusionPath:(UIBezierPath *)exclusionPath;
@end


@interface UIImage (ResizableImage)
- (UIImage *) resizableImage:(UIEdgeInsets)insets;
@end


@interface UIImage (ImageEffects)

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyBlurEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;
@end
