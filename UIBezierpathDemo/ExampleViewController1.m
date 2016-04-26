//
//  ExampleViewController1.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/25.
//  Copyright © 2016年 Four_w. All rights reserved.
//
/**
 *  项目中遇到的二维码扫描,用的系统的二维码,就写了一个阴影框
 */

#import "ExampleViewController1.h"

#define kSelfWidth self.view.bounds.size.width
#define kSelfHeight self.view.bounds.size.height

@interface ExampleViewController1 ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

//因二维码扫描区域为比例确定 所以 此处用比例定高宽
//识别区域的坐标为
//x (1-self.widthScale)/2*kSelfWidth
//y (1-self.heightScale)/2*kSelfHeight
//right (1+self.widthScale)/2*kSelfWidth
//bottom (1+self.heightScale)/2*kSelfHeight
@property (nonatomic, assign) CGFloat widthScale;
@property (nonatomic, assign) CGFloat heightScale;

@end

@implementation ExampleViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view.layer addSublayer:self.shapeLayer];
    
}
#pragma mark - Property
- (CGFloat)widthScale
{
    if (!_widthScale) {
        _widthScale = 520.f/750.f;;
    }
    return _widthScale;
}
- (CGFloat)heightScale
{
    if (!_heightScale) {
        _heightScale = 520.f/1334.f;;
    }
    return _heightScale;
}
- (UIBezierPath *)path
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, kSelfWidth, kSelfHeight) cornerRadius:0];
    [path appendPath:self.squarePath];
    [path setUsesEvenOddFillRule:YES];
    return path;
}
- (UIBezierPath *)squarePath
{
    UIBezierPath * squarePath = [UIBezierPath bezierPath];
    [squarePath moveToPoint:CGPointMake((1-self.widthScale)/2*kSelfWidth, (1-self.heightScale)/2*kSelfHeight)];
    [squarePath addLineToPoint:CGPointMake((1+self.widthScale)/2*kSelfWidth, (1-self.heightScale)/2*kSelfHeight)];
    [squarePath addLineToPoint:CGPointMake((1+self.widthScale)/2*kSelfWidth, (1+self.heightScale)/2*kSelfHeight)];
    [squarePath addLineToPoint:CGPointMake((1-self.widthScale)/2*kSelfWidth, (1+self.heightScale)/2*kSelfHeight)];
    [squarePath addLineToPoint:CGPointMake((1-self.widthScale)/2*kSelfWidth, (1-self.heightScale)/2*kSelfHeight)];
    return squarePath;
}
- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [[CAShapeLayer alloc]init];
        _shapeLayer.path = self.path.CGPath;
        _shapeLayer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8].CGColor;
        _shapeLayer.fillRule = kCAFillRuleEvenOdd;
    }
    return _shapeLayer;
}


@end
