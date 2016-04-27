//
//  AnimationWordView.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/26.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "AnimationWordView.h"


#define kSelfWidth self.bounds.size.width
#define kSelfHeight self.bounds.size.height


#define kWordLineWidth 1.0f

#define kWordFont CTFontCreateWithName(CFSTR("STHeitiTC-Light"), 40, NULL)

#define kPenImage [UIImage imageNamed:@"pen"]

#define kPenFrame CGRectMake(0.0f, 0.0f, self.penImage.size.width, self.penImage.size.height)

#define kAnimationDuration 10.0f

#define kWordColor [UIColor greenColor]

@interface AnimationWordView ()

@property (nonatomic, strong) CALayer *animationLayer;

@property (nonatomic, strong) CAShapeLayer *pathLayer;

@property (nonatomic, strong) CALayer *penLayer;

@property (nonatomic, strong) CABasicAnimation *pathAnimation;

@property (nonatomic, strong) CAKeyframeAnimation *penAnimation;
@end

@implementation AnimationWordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.wordLineWidth = kWordLineWidth;
        self.wordFont = kWordFont;
        self.penImage = kPenImage;
        self.penFrame = kPenFrame;
        self.animationDuration = kAnimationDuration;
        self.wordColor = kWordColor;
        
        self.penHidden = NO;
        self.animationPepeatly = YES;
        self.animationAutoreverses = YES;
        [self.layer addSublayer:self.animationLayer];
    }
    return self;
}
- (CALayer *)animationLayer
{
    if (!_animationLayer) {
        _animationLayer = [CALayer layer];
        _animationLayer.frame = self.bounds;
    }
    return _animationLayer;
}
- (CAShapeLayer *)pathLayer
{
    if (!_pathLayer) {
        _pathLayer = [CAShapeLayer layer];
        _pathLayer.frame = self.animationLayer.bounds;
        _pathLayer.geometryFlipped = YES;
        _pathLayer.strokeColor = [self.wordColor CGColor];
        _pathLayer.fillColor = nil;
        _pathLayer.lineWidth = self.wordLineWidth;
        _pathLayer.lineJoin = kCALineJoinRound;
    }
    return _pathLayer;
}
- (CALayer *)penLayer
{
    if (!_penLayer) {
        _penLayer = [CALayer layer];
        _penLayer.contents = (id)self.penImage.CGImage;
        _penLayer.anchorPoint = CGPointZero;
        _penLayer.frame = self.penFrame;
    }
    return _penLayer;
}
- (CABasicAnimation *)pathAnimation
{
    if (!_pathAnimation) {
        _pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        _pathAnimation.duration = self.animationDuration;
        _pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        _pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        _pathAnimation.autoreverses = self.animationAutoreverses;
    }
    return _pathAnimation;
}
- (CAKeyframeAnimation *)penAnimation
{
    if (!_penAnimation) {
        _penAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        _penAnimation.duration = self.animationDuration;
        _penAnimation.calculationMode = kCAAnimationPaced;
        _penAnimation.delegate = self;
        _penAnimation.autoreverses = self.animationAutoreverses;
    }
    return _penAnimation;
}
- (void)setWordLineWidth:(CGFloat)wordLineWidth
{
    _wordLineWidth = wordLineWidth;
    self.pathLayer.lineWidth = self.wordLineWidth;
}
- (void)setAnimationDuration:(CGFloat)animationDuration
{
    _animationDuration = animationDuration;
    self.pathAnimation.duration = animationDuration;
    self.penAnimation.duration = animationDuration;
}
- (void)setPenFrame:(CGRect)penFrame
{
    _penFrame = penFrame;
    self.penLayer.frame = self.penFrame;
}
- (void)setPenImage:(UIImage *)penImage
{
    _penImage = penImage;
    self.penLayer.contents = (id)self.penImage.CGImage;
}
- (void)setWordColor:(UIColor *)wordColor
{
    _wordColor = wordColor;
    self.pathLayer.strokeColor = [wordColor CGColor];
}
- (void)setWordFont:(CTFontRef)wordFont
{
    _wordFont = wordFont;
    [self setAnimationWord:self.animationWord];
}
- (void)setAnimationPepeatly:(BOOL)animationPepeatly
{
    _animationPepeatly = animationPepeatly;
    if (animationPepeatly) {
        self.pathAnimation.repeatCount = 1e100;
        self.penAnimation.repeatCount = 1e100;

    }else{
        self.pathAnimation.repeatCount = 0;
        self.penAnimation.repeatCount = 0;
    }
}
- (void)setAnimationAutoreverses:(BOOL)animationAutoreverses
{
    _animationAutoreverses = animationAutoreverses;
    _pathAnimation.autoreverses = self.animationAutoreverses;
    _penAnimation.autoreverses = self.animationAutoreverses;
}
- (void)setAnimationWord:(NSString *)animationWord
{
    _animationWord = animationWord;
    if ([self.animationWord length] <= 0) {
        return;
    }
    
    if (self.pathLayer != nil) {
        [self.penLayer removeFromSuperlayer];
        [self.pathLayer removeFromSuperlayer];
    }
    
    //此处代码网上找的资料,还未研究
    CGMutablePathRef letters = CGPathCreateMutable();
    
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge id)self.wordFont, kCTFontAttributeName,
                           nil];
    
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:animationWord attributes:attrs];
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    // for each RUN
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        // Get FONT for this run
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        // for each GLYPH in run
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            // get Glyph & Glyph-data
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            // Get PATH of outline
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    
    CGPathRelease(letters);
    CFRelease(self.wordFont);
    
    [self setUpWithBezierPath:path];
}
- (void)setUpWithBezierPath:(UIBezierPath *)path
{
    self.pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    self.pathLayer.path = path.CGPath;
    
    [self.animationLayer addSublayer:self.pathLayer];
    self.penAnimation.path = self.pathLayer.path;
    [self.pathLayer addSublayer:self.penLayer];
    
}
- (void) startAnimation
{
    [self.pathLayer removeAllAnimations];
    [self.penLayer removeAllAnimations];
    
    self.penLayer.hidden = self.penHidden;
    
    [self.pathLayer addAnimation:self.pathAnimation forKey:@"strokeEnd"];
    [self.penLayer addAnimation:self.penAnimation forKey:@"position"];
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.penLayer.hidden = YES;
}

@end
