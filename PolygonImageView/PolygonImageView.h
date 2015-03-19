//
//  PentagonImageView.h
//  PentagonImageView
//
//  Created by Adrián Bouza Correa on 19/3/15.
//  Copyright (c) 2015 adboco. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface PolygonImageView : UIImageView

@property (nonatomic, retain) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable NSUInteger sides;

-(id)initWithFrame:(CGRect)frame borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth sides:(NSUInteger)sides;
-(id)initWithImage:(UIImage *)image borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth sides:(NSUInteger)sides;
-(id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth sides:(NSUInteger)sides;


@end
