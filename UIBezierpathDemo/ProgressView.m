//
//  ProgressView.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/26.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ProgressView.h"

#define kSelfWidth self.bounds.size.width
#define kSelfHeight self.bounds.size.height

@interface ProgressView ()

@property (nonatomic, assign) CGFloat radius;//半径

//表层
@property (nonatomic, strong) CAShapeLayer *topShapeLayer;
//底层
@property (nonatomic, strong) CAShapeLayer *bottomShapeLayer;

@end

@implementation ProgressView

- (instancetype)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.layer addSublayer:self.bottomShapeLayer];
        [self.layer addSublayer:self.topShapeLayer];
        
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
//三角形
- (UIBezierPath *)trianglePath
{
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(self.bounds.size.width/2, 0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path closePath];
    return path;
}
//正方形
- (UIBezierPath *)squarePath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    [path closePath];
    return path;
}

//圆环路径
- (UIBezierPath *)circlePath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.radius, self.radius) radius:self.radius - 5 startAngle:- M_PI_2 endAngle:- M_PI_2 + 2 * M_PI clockwise:YES];
    return path;
}
//五角星路径
- (UIBezierPath *)pentagrammePath
{
    UIBezierPath *path = [[UIBezierPath alloc]init];
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(kSelfWidth/2, 0)];
    [path addLineToPoint:CGPointMake(kSelfWidth*13/16, kSelfHeight*19/20)];
    [path addLineToPoint:CGPointMake(0, kSelfHeight*29/80)];
    [path addLineToPoint:CGPointMake(kSelfWidth, kSelfHeight*29/80)];
    [path addLineToPoint:CGPointMake(kSelfWidth*3/16, kSelfHeight*19/20)];
    [path closePath];
    return path;
}

//表层CAShapeLayer
- (CAShapeLayer *)topShapeLayer
{
    if (!_topShapeLayer) {
        _topShapeLayer = [[CAShapeLayer alloc]init];
        _topShapeLayer.fillColor = [UIColor clearColor].CGColor;
        _topShapeLayer.lineWidth = 5;
        _topShapeLayer.strokeColor = [UIColor greenColor].CGColor;
        _topShapeLayer.strokeEnd = 0;
    }
    return _topShapeLayer;
}
//底层CAShapeLayer
- (CAShapeLayer *)bottomShapeLayer
{
    if (!_bottomShapeLayer) {
        _bottomShapeLayer = [[CAShapeLayer alloc]init];
        _bottomShapeLayer.fillColor = [UIColor clearColor].CGColor;
        _bottomShapeLayer.lineWidth = 4;
        _bottomShapeLayer.strokeColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1].CGColor;
    }
    return _bottomShapeLayer;
}
//设置进度Progress
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    self.topShapeLayer.strokeEnd = progress;
}
//设置类型
- (void)setProgressViewType:(ProgressViewType)progressViewType
{
    _progressViewType = progressViewType;
    self.topShapeLayer.strokeEnd = 0;

    switch (progressViewType) {
            
        case ProgressViewType1:
            //横线
            self.bottomShapeLayer.path = self.horizontalLinePath.CGPath;
            self.topShapeLayer.path = self.horizontalLinePath.CGPath;
            break;
        case ProgressViewType2:
            //单圆环
            self.bottomShapeLayer.path = nil;
            self.topShapeLayer.path = self.circlePath.CGPath;
            break;
        case ProgressViewType3:
            //双圆环
            self.bottomShapeLayer.path = self.circlePath.CGPath;
            self.topShapeLayer.path = self.circlePath.CGPath;
            break;
        case ProgressViewType4:
            //三角形
            self.bottomShapeLayer.path = self.trianglePath.CGPath;
            self.topShapeLayer.path = self.trianglePath.CGPath;
            
            break;
        case ProgressViewType5:
            //正方形
            self.bottomShapeLayer.path = self.squarePath.CGPath;
            self.topShapeLayer.path = self.squarePath.CGPath;
            
            break;
        case ProgressViewType6:
            //五角星
            self.bottomShapeLayer.path = self.pentagrammePath.CGPath;
            self.topShapeLayer.path = self.pentagrammePath.CGPath;
            
            break;

        default:
            break;
    }
}
@end
