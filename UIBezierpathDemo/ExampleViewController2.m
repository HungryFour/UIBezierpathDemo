//
//  ExampleViewController2.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/25.
//  Copyright © 2016年 Four_w. All rights reserved.
//
/**
 *  项目中的一个优惠券的样子
 *
 */

#import "ExampleViewController2.h"

#define kSelfWidth self.couponView.bounds.size.width
#define kSelfHeight self.couponView.bounds.size.height
#define kCircleDiameter self.couponView.bounds.size.height*30.00/232.00
#define kCircleCenterY self.couponView.bounds.size.height*92.00/232.00


@interface ExampleViewController2 ()

@property (strong, nonatomic) UIView *couponView;
/**
 *  优惠券颜色
 */
@property (strong, nonatomic) UIColor *couponColor;
/**
 *  优惠券名称
 */
@property (strong, nonatomic) UILabel *titleLabel;
/**
 *  优惠券详细
 */
@property (strong, nonatomic) UILabel *decLabel;


@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CAShapeLayer *dashLineLayer;

@end

@implementation ExampleViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.couponColor = [UIColor redColor];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addViews];
}
#pragma mark - AddViews
- (void)addViews
{
    [self.view addSubview:self.couponView];

    [self.couponView.layer addSublayer:self.shapeLayer];
    [self.couponView.layer addSublayer:self.dashLineLayer];
    [self.couponView addSubview:self.titleLabel];
    [self.couponView addSubview:self.decLabel];
}
#pragma mark - Property
- (UIView *)couponView
{
    if (!_couponView) {
        _couponView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    }
    return _couponView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kSelfWidth, kCircleCenterY)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"现金券";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor= [UIColor whiteColor];
    }
    return _titleLabel;
}
- (UILabel *)decLabel
{
    if (!_decLabel) {
        _decLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kCircleCenterY, kSelfWidth, kSelfHeight-kCircleCenterY)];
        _decLabel.textAlignment = NSTextAlignmentCenter;
        _decLabel.text = @"10000元";
        _decLabel.font = [UIFont systemFontOfSize:14];
        _decLabel.textColor= [UIColor whiteColor];
    }
    return _decLabel;
}
- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.path = self.bezierPath.CGPath;
        _shapeLayer.fillColor = [UIColor grayColor].CGColor;
    }
    return _shapeLayer;
}
-(UIBezierPath *)bezierPath
{
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 0)];
    [bezierPath addLineToPoint:CGPointMake(kSelfWidth, 0)];
    [bezierPath addLineToPoint:CGPointMake(kSelfWidth, kCircleCenterY-kCircleDiameter)];
    [bezierPath addArcWithCenter:CGPointMake(kSelfWidth, kCircleCenterY)
                     radius:kCircleDiameter
                 startAngle:M_PI*1.5
                   endAngle:M_PI*0.5
                  clockwise:NO];
    
    [bezierPath addLineToPoint:CGPointMake(kSelfWidth, kSelfHeight)];
    [bezierPath addLineToPoint:CGPointMake(0, kSelfHeight)];
    
    [bezierPath addLineToPoint:CGPointMake(0, kCircleCenterY+kCircleDiameter)];
    [bezierPath addArcWithCenter:CGPointMake(0, kCircleCenterY)
                     radius:kCircleDiameter
                 startAngle:M_PI*0.5
                   endAngle:M_PI*1.5
                  clockwise:NO];
    [bezierPath addLineToPoint:CGPointMake(0, 0)];
    return bezierPath;
}
- (CAShapeLayer *)dashLineLayer
{
    if (!_dashLineLayer) {
        
        CGFloat layerWidth = kSelfWidth-(kCircleDiameter+5)*2;
        
        _dashLineLayer = [CAShapeLayer layer];
        [_dashLineLayer setFrame:CGRectMake(kCircleDiameter+5, kCircleCenterY, layerWidth, 2)];
        [_dashLineLayer setFillColor:[[UIColor whiteColor] CGColor]];
        
        // 设置虚线颜色
        [_dashLineLayer setStrokeColor:[[UIColor whiteColor] CGColor]];
        // 3=线的宽度 1=每条线的间距
        [_dashLineLayer setLineDashPattern:
         [NSArray arrayWithObjects:[NSNumber numberWithInt:layerWidth/18*3/4],
          [NSNumber numberWithInt:layerWidth/18/4],nil]];
        
        //设置倾斜度
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddLineToPoint(path, NULL, layerWidth,0);
        
        [_dashLineLayer setPath:path];
        CGPathRelease(path);
    }
    return _dashLineLayer;
}

#pragma mark - SrtUp
- (void)setCouponColor:(UIColor *)couponColor
{
    self.shapeLayer.fillColor = couponColor.CGColor;
}

@end
