//
//  PolygonImageView.m
//  PolygonImageView
//
//  Created by Adrián Bouza Correa on 19/3/15.
//  Copyright (c) 2015 adboco. All rights reserved.
//

#import "PolygonImageView.h"

#define DEFAULT_BORDER_WIDTH 2.0f
#define DEFAULT_CORNER_RADIUS 5.0f
#define DEFAULT_SIDES 5;

@interface PolygonImageView()

-(void)applyPolygonMask;

@end

@implementation PolygonImageView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    if (self) {
        _borderColor = [UIColor whiteColor];
        _borderWidth = DEFAULT_BORDER_WIDTH;
        _cornerRadius = DEFAULT_CORNER_RADIUS;
        _sides = DEFAULT_SIDES;
        [self applyPolygonMask];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _borderColor = [UIColor whiteColor];
        _borderWidth = DEFAULT_BORDER_WIDTH;
        _cornerRadius = DEFAULT_CORNER_RADIUS;
        _sides = DEFAULT_SIDES;
        [self applyPolygonMask];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth sides:(NSUInteger)sides{
    self = [super initWithFrame:frame];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    if (self) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        _cornerRadius = DEFAULT_CORNER_RADIUS;
        _sides = sides;
        [self applyPolygonMask];
    }
    return self;
}

-(id)initWithImage:(UIImage *)image borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth sides:(NSUInteger)sides{
    self = [super initWithImage:image];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    if (self) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        _cornerRadius = DEFAULT_CORNER_RADIUS;
        _sides = sides;
        [self applyPolygonMask];
    }
    return self;
}

-(id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth sides:(NSUInteger)sides{
    self = [super initWithImage:image highlightedImage:image];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    if (self) {
        _borderColor = borderColor;
        _borderWidth = borderWidth;
        _cornerRadius = DEFAULT_CORNER_RADIUS;
        _sides = sides;
        [self applyPolygonMask];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self applyPolygonMask];
}

-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    [self applyPolygonMask];
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    [self applyPolygonMask];
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    [self applyPolygonMask];
}

-(void)setSides:(NSUInteger)sides{
    _sides = sides;
    [self applyPolygonMask];
}

-(void)setImage:(UIImage *)image{
    [super setImage:image];
    [self applyPolygonMask];
}

-(void)applyPolygonMask{
    //// Polygon Drawing
    UIBezierPath* polygonPath = [self roundedPolygonPathWithRect:self.frame lineWidth:_borderWidth sides:_sides cornerRadius:_cornerRadius];
    
    // Mask
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = polygonPath.CGPath;
    maskLayer.lineWidth = _borderWidth;
    maskLayer.strokeColor = [UIColor clearColor].CGColor;
    maskLayer.fillColor = [UIColor whiteColor].CGColor;
    
    self.layer.mask = maskLayer;
    self.layer.masksToBounds = YES;
    
    // Border
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.path = polygonPath.CGPath;
    borderLayer.lineWidth = _borderWidth;
    borderLayer.strokeColor = _borderColor.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    self.layer.sublayers = nil;
    [self.layer addSublayer:borderLayer];
}

- (UIBezierPath *)roundedPolygonPathWithRect:(CGRect)square
                                   lineWidth:(CGFloat)lineWidth
                                       sides:(NSInteger)sides
                                cornerRadius:(CGFloat)cornerRadius
{
    UIBezierPath *path  = [UIBezierPath bezierPath];
    
    CGFloat theta       = 2.0 * M_PI / sides;                           // how much to turn at every corner
    CGFloat offset      = cornerRadius * tanf(theta / 2.0);             // offset from which to start rounding corners
    CGFloat squareWidth = MIN(square.size.width, square.size.height);   // width of the square
    
    CGFloat offsetX = ((square.size.width - squareWidth)/2);
    CGFloat offsetY = ((square.size.height - squareWidth)/2);
    
    // calculate the length of the sides of the polygon
    
    CGFloat length      = squareWidth - lineWidth;
    if (sides % 4 != 0) {                                               // if not dealing with polygon which will be square with all sides ...
        length = length * cosf(theta / 2.0) + offset/2.0;               // ... offset it inside a circle inside the square
    }
    CGFloat sideLength = length * tanf(theta / 2.0);
    
    // start drawing at `point` in lower right corner
    
    CGPoint point = CGPointMake(squareWidth / 2.0 + sideLength / 2.0 - offset + offsetX, squareWidth - (squareWidth - length) / 2.0 + offsetY);
    CGFloat angle = M_PI;
    [path moveToPoint:point];
    
    // draw the sides and rounded corners of the polygon
    
    for (NSInteger side = 0; side < sides; side++) {
        point = CGPointMake(point.x + (sideLength - offset * 2.0) * cosf(angle), point.y + (sideLength - offset * 2.0) * sinf(angle));
        [path addLineToPoint:point];
        
        CGPoint center = CGPointMake(point.x + cornerRadius * cosf(angle + M_PI_2), point.y + cornerRadius * sinf(angle + M_PI_2));
        [path addArcWithCenter:center radius:cornerRadius startAngle:angle - M_PI_2 endAngle:angle + theta - M_PI_2 clockwise:YES];
        
        point = path.currentPoint; // we don't have to calculate where the arc ended ... UIBezierPath did that for us
        angle += theta;
    }
    
    [path closePath];
    
    return path;
}

@end
