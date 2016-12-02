//
//  NestCircleProgressBar.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 2016/11/24.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "NestCircleProgressBar.h"
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

const CFTimeInterval animationDuration = 4.00;

const CGFloat spaceAngle = M_PI*2.00*0.01;

const CGFloat progressAngle = M_PI*2-(M_PI*2*0.01)*3;

@interface NestCircleProgressBar ()<CAAnimationDelegate>

@property (nonatomic, assign) CGFloat radius;//半径

@property (nonatomic, strong) CAShapeLayer *firstShapeLayer;
@property (nonatomic, strong) CAGradientLayer *firstGradientLayer;

@property (nonatomic, strong) CAShapeLayer *secondShapeLayer;
@property (nonatomic, strong) CAGradientLayer *secondGradientLayer;

@property (nonatomic, strong) CAShapeLayer *thirdShapeLayer;
@property (nonatomic, strong) CAGradientLayer *thirdGradientLayer;

//底层
@property (nonatomic, strong) CAShapeLayer *bottomShapeLayer;

@property (nonatomic, strong) NSArray *gradientColors;

@property (nonatomic, assign) CGPoint gradientStartPoint;

@property (nonatomic, assign) CGPoint gradientEndPoint;

@property (nonatomic, strong) NSArray *gradientLocations;



@end

@implementation NestCircleProgressBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self.layer addSublayer:self.bottomShapeLayer];

        self.gradientColors = [NSArray arrayWithObjects:(id) UIColorFromRGB(0x77BE38).CGColor ,(id)[UIColor blueColor].CGColor, nil];
        self.gradientStartPoint = CGPointMake(0, 0);
        self.gradientEndPoint = CGPointMake(1, 0);
        self.gradientLocations = @[@0,@1];
    }
    return self;
}
//圆环路径
- (UIBezierPath *)circlePath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.radius, self.radius) radius:self.radius - 5 startAngle:- M_PI_2 endAngle:- M_PI_2 + 2 * M_PI clockwise:YES];
    return path;
}
//圆环半径
- (CGFloat)radius
{
    return self.frame.size.width*0.5;
}
- (UIBezierPath *)bezierPathForStartAngle:(CGFloat)startAngle
                                 endAngle:(CGFloat)endAngle
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.radius, self.radius) radius:self.radius - 5 startAngle:startAngle endAngle: endAngle clockwise:YES];
    return bezierPath;
}
//表层CAShapeLayer
- (CAShapeLayer *)firstShapeLayer
{
    if (!_firstShapeLayer) {
        _firstShapeLayer = [[CAShapeLayer alloc]init];
        _firstShapeLayer.fillColor = nil;
        _firstShapeLayer.lineWidth = 5;
        _firstShapeLayer.strokeColor = [UIColor greenColor].CGColor;
        _firstShapeLayer.lineJoin = kCALineJoinRound;
        _firstShapeLayer.lineCap = kCALineCapRound;
    }
    return _firstShapeLayer;
}
- (CAGradientLayer *)firstGradientLayer{
    if (!_firstGradientLayer) {
        _firstGradientLayer = [CAGradientLayer layer];
        _firstGradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [_firstGradientLayer setColors:[NSArray arrayWithObjects:(id) UIColorFromRGB(0x8C00FF).CGColor ,(id)UIColorFromRGB(0x7454FF).CGColor, nil]];
        [_firstGradientLayer setLocations:self.gradientLocations];
        [_firstGradientLayer setStartPoint:self.gradientStartPoint];
        [_firstGradientLayer setEndPoint:self.gradientEndPoint];
    }
    return _firstGradientLayer;
}
- (CAShapeLayer *)secondShapeLayer
{
    if (!_secondShapeLayer) {
        _secondShapeLayer = [[CAShapeLayer alloc]init];
        _secondShapeLayer.fillColor = nil;
        _secondShapeLayer.lineWidth = 5;
        _secondShapeLayer.strokeColor = [UIColor greenColor].CGColor;
        _secondShapeLayer.lineJoin = kCALineJoinRound;
        _secondShapeLayer.lineCap = kCALineCapRound;
    }
    return _secondShapeLayer;
}
- (CAGradientLayer *)secondGradientLayer{
    if (!_secondGradientLayer) {
        _secondGradientLayer = [CAGradientLayer layer];
        _secondGradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [_secondGradientLayer setColors:[NSArray arrayWithObjects:(id) UIColorFromRGB(0x38A5EC).CGColor ,(id)UIColorFromRGB(0x3251FD).CGColor, nil]];
        [_secondGradientLayer setLocations:self.gradientLocations];
        [_secondGradientLayer setStartPoint:self.gradientStartPoint];
        [_secondGradientLayer setEndPoint:self.gradientEndPoint];
    }
    return _secondGradientLayer;
}
- (CAShapeLayer *)thirdShapeLayer
{
    if (!_thirdShapeLayer) {
        _thirdShapeLayer = [[CAShapeLayer alloc]init];
        _thirdShapeLayer.fillColor = nil;
        _thirdShapeLayer.lineWidth = 5;
        _thirdShapeLayer.strokeColor = [UIColor greenColor].CGColor;
        _thirdShapeLayer.lineJoin = kCALineJoinRound;
        _thirdShapeLayer.lineCap = kCALineCapRound;
    }
    return _thirdShapeLayer;
}
- (CAGradientLayer *)thirdGradientLayer{
    if (!_thirdGradientLayer) {
        _thirdGradientLayer = [CAGradientLayer layer];
        _thirdGradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [_thirdGradientLayer setColors:[NSArray arrayWithObjects:(id) UIColorFromRGB(0x21C8CF).CGColor ,(id)UIColorFromRGB(0x77BE38).CGColor, nil]];
        [_thirdGradientLayer setLocations:self.gradientLocations];
        [_thirdGradientLayer setStartPoint:self.gradientStartPoint];
        [_thirdGradientLayer setEndPoint:self.gradientEndPoint];
    }
    return _thirdGradientLayer;
}
//底层CAShapeLayer
- (CAShapeLayer *)bottomShapeLayer
{
    if (!_bottomShapeLayer) {
        _bottomShapeLayer = [[CAShapeLayer alloc]init];
        _bottomShapeLayer.fillColor = [UIColor clearColor].CGColor;
        _bottomShapeLayer.lineWidth = 20;
        _bottomShapeLayer.strokeColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1].CGColor;
        _bottomShapeLayer.path = self.circlePath.CGPath;
    }
    return _bottomShapeLayer;
}
- (CABasicAnimation *)addAnimationWithBeginTime:(CFTimeInterval)time
                                       duration:(CFTimeInterval)duration{

    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = duration;
    pathAnimation.beginTime = CACurrentMediaTime() + time;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    pathAnimation.fromValue =[NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    pathAnimation.delegate = self;
    pathAnimation.fillMode = kCAFillModeBackwards;
    return pathAnimation;
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

}
- (void)setFirstPercentage:(CGFloat)firstPercentage
          secondPercentage:(CGFloat)secondPercentage
           thirdPercentage:(CGFloat)thirdPercentage{

    if (self.firstShapeLayer != nil) {
        [self.firstShapeLayer removeAllAnimations];
        [self.firstShapeLayer removeFromSuperlayer];
        self.firstShapeLayer.path = nil;
        [self.firstGradientLayer removeFromSuperlayer];
    }
    if (self.secondShapeLayer != nil) {
        [self.secondShapeLayer removeAllAnimations];
        [self.secondShapeLayer removeFromSuperlayer];
        self.secondShapeLayer.path = nil;
        [self.secondGradientLayer removeFromSuperlayer];

    }
    if (self.thirdShapeLayer != nil) {
        [self.thirdShapeLayer removeAllAnimations];
        [self.thirdShapeLayer removeFromSuperlayer];
        self.thirdShapeLayer.path = nil;
        [self.thirdGradientLayer removeFromSuperlayer];
    }

    [self.layer addSublayer:self.firstShapeLayer];
    [self.layer addSublayer:self.secondShapeLayer];
    [self.layer addSublayer:self.thirdShapeLayer];

    CGFloat firstStart = M_PI*3/2;
    CGFloat firstEnd = firstStart+progressAngle*firstPercentage;

    CGFloat secondStart = firstEnd+spaceAngle;
    CGFloat secondEnd = secondStart+progressAngle*secondPercentage;

    CGFloat thirdStart = secondEnd+spaceAngle;
    CGFloat thirddEnd = thirdStart+progressAngle*thirdPercentage;


    self.firstShapeLayer.path = [self bezierPathForStartAngle:firstStart endAngle:firstEnd].CGPath;
    self.secondShapeLayer.path = [self bezierPathForStartAngle:secondStart endAngle:secondEnd].CGPath;
    self.thirdShapeLayer.path = [self bezierPathForStartAngle:thirdStart endAngle:thirddEnd].CGPath;

    [self.firstGradientLayer setMask:self.firstShapeLayer];
    [self.layer addSublayer:self.firstGradientLayer];

    [self.secondGradientLayer setMask:self.secondShapeLayer];
    [self.layer addSublayer:self.secondGradientLayer];

    [self.thirdGradientLayer setMask:self.thirdShapeLayer];
    [self.layer addSublayer:self.thirdGradientLayer];

    [self.firstShapeLayer addAnimation:[self addAnimationWithBeginTime:0 duration:animationDuration*firstPercentage] forKey:@"strokeEnd"];
    [self.secondShapeLayer addAnimation:[self addAnimationWithBeginTime:animationDuration*firstPercentage duration:animationDuration*secondPercentage] forKey:@"strokeEnd"];
    [self.thirdShapeLayer addAnimation:[self addAnimationWithBeginTime:animationDuration*secondPercentage duration:animationDuration*thirdPercentage] forKey:@"strokeEnd"];

}
@end
