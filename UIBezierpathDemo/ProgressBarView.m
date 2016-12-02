//
//  ProgressBarView.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 2016/12/2.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ProgressBarView.h"
#define kSelfWidth self.bounds.size.width
#define kSelfHeight self.bounds.size.height

@interface ProgressBarView ()

@property (nonatomic, assign) CGFloat radius;//半径
//表层
@property (nonatomic, strong) CAShapeLayer *topShapeLayer;
//底层
@property (nonatomic, strong) CAShapeLayer *bottomShapeLayer;
//渐变色层
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation ProgressBarView

- (instancetype)initWithFrame:(CGRect)frame progressBarType:(ProgressBarType)barType{
    self = [super initWithFrame:frame];
    if (self) {
        self.barType = barType;
        self.lineWidth = 5;
        self.barBackgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        self.barColor = [UIColor greenColor];
        [self.layer addSublayer:self.bottomShapeLayer];
        [self.layer addSublayer:self.topShapeLayer];

        self.gradientColors = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor ,(id)[UIColor yellowColor].CGColor, nil];
    }
    return self;
}
//圆环半径
- (CGFloat)radius
{
    return self.frame.size.width*0.5;
}
//横线路径
- (UIBezierPath *)horizontalLinePath
{
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height/2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height/2)];
    [path stroke];
    return path;
}
//圆环路径
- (UIBezierPath *)circlePath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.radius, self.radius) radius:self.radius - 5 startAngle:- M_PI_2 endAngle:- M_PI_2 + 2 * M_PI clockwise:YES];
    return path;
}
//表层CAShapeLayer
- (CAShapeLayer *)topShapeLayer
{
    if (!_topShapeLayer) {
        _topShapeLayer = [[CAShapeLayer alloc]init];
        _topShapeLayer.fillColor = [UIColor clearColor].CGColor;
        _topShapeLayer.strokeColor = [UIColor greenColor].CGColor;
        _topShapeLayer.strokeEnd = 0;
        _topShapeLayer.lineCap = kCALineJoinRound;
    }
    return _topShapeLayer;
}
//底层CAShapeLayer
- (CAShapeLayer *)bottomShapeLayer
{
    if (!_bottomShapeLayer) {
        _bottomShapeLayer = [[CAShapeLayer alloc]init];
        _bottomShapeLayer.fillColor = [UIColor clearColor].CGColor;
        _bottomShapeLayer.strokeColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1].CGColor;
        _bottomShapeLayer.lineCap = kCALineJoinRound;
    }
    return _bottomShapeLayer;
}
- (CAGradientLayer *)gradientLayer{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        [_gradientLayer setLocations:@[@0,@1 ]];
        [_gradientLayer setStartPoint:CGPointMake(0.5, 0)];
        [_gradientLayer setEndPoint:CGPointMake(0.5, 1)];
    }
    return _gradientLayer;
}
//设置进度Progress
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    self.topShapeLayer.strokeEnd = progress;
}
- (void)setGradientColors:(NSArray *)gradientColors{
    _gradientColors = gradientColors;
    [self.gradientLayer setColors:_gradientColors];
}
- (void)setShowsGradientColor:(BOOL)showsGradientColor{
    _showsGradientColor = showsGradientColor;
    if (_showsGradientColor) {
        [self.layer addSublayer:self.gradientLayer];
    }else{
        if (self.gradientLayer.superlayer) {
            [self.gradientLayer removeFromSuperlayer];
        }
    }
}
- (void)setBarColor:(UIColor *)barColor{
    _barColor = barColor;
    self.topShapeLayer.strokeColor = _barColor.CGColor;
}
- (void)setBarBackgroundColor:(UIColor *)barBackgroundColor{
    _barBackgroundColor = barBackgroundColor;
    self.bottomShapeLayer.strokeColor = _barBackgroundColor.CGColor;
}
- (void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    self.topShapeLayer.lineWidth = _lineWidth;;
    self.bottomShapeLayer.lineWidth = _lineWidth;
}
- (void)setBarType:(ProgressBarType)barType{
    _barType = barType;
    self.topShapeLayer.strokeEnd = 0;

    switch (barType) {
        case 0:
            //横线
            self.bottomShapeLayer.path = self.horizontalLinePath.CGPath;
            self.topShapeLayer.path = self.horizontalLinePath.CGPath;
            break;
        case 1:
            //横线
            self.bottomShapeLayer.path = self.circlePath.CGPath;
            self.topShapeLayer.path = self.circlePath.CGPath;
            break;


        default:
            break;
    }

}
@end
