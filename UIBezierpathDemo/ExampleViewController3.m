//
//  ExampleViewController3.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/25.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ExampleViewController3.h"
#define kSelfWidth self.view.bounds.size.width
#define kSelfHeight self.view.bounds.size.height

@interface ExampleViewController3 ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;


@property (strong, nonatomic)UISegmentedControl *segmentedControl;

@end

@implementation ExampleViewController3

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.segmentedControl];
    [self.view.layer addSublayer:self.shapeLayer];
}
#pragma mark - Property
- (UISegmentedControl *)segmentedControl
{
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"矩形",@"内切圆",@"内切椭圆",@"矩形画圆角角",@"圆弧"]];
        _segmentedControl.frame = CGRectMake(10, 80, kSelfWidth-20, 40);
        [_segmentedControl addTarget:self action:@selector(segmentedControlSelected:) forControlEvents:UIControlEventValueChanged];;
    }
    return _segmentedControl;
}
- (void)segmentedControlSelected:(UISegmentedControl *)sc
{
    switch (sc.selectedSegmentIndex) {
        case 0:
            _shapeLayer.path = self.rectanglePath.CGPath;
            _shapeLayer.fillColor = [UIColor greenColor].CGColor;
            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;

            break;
        case 1:
            _shapeLayer.path = self.inscribedCirclePath.CGPath;
            _shapeLayer.fillColor = [UIColor greenColor].CGColor;
            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;

            break;
        case 2:
            _shapeLayer.path = self.inscribedEllipsePath.CGPath;
            _shapeLayer.fillColor = [UIColor greenColor].CGColor;
            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;

            break;
        case 3:
            _shapeLayer.path = self.rectangleFilletPath.CGPath;
            _shapeLayer.fillColor = [UIColor greenColor].CGColor;
            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;

            break;
        case 4:
            _shapeLayer.path = self.ArcPath.CGPath;
            _shapeLayer.fillColor = [UIColor clearColor].CGColor;
            _shapeLayer.strokeColor = [UIColor greenColor].CGColor;

            break;
            
        default:
            break;
    }
    
}

- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.path = self.inscribedCirclePath.CGPath;
        _shapeLayer.fillColor = [UIColor greenColor].CGColor;
    }
    return _shapeLayer;
}
//矩形
-(UIBezierPath *)rectanglePath
{
    
    //方法一:通过连点去创建一个规则图形
    //    if (!_path) {
    //        _path = [[UIBezierPath alloc] init];
    //        [_path moveToPoint:CGPointMake(100, 100)];
    //        [_path addLineToPoint:CGPointMake(200, 100)];
    //        [_path addLineToPoint:CGPointMake(200,200)];
    //        [_path addLineToPoint:CGPointMake(100, 200)];
    //        [_path addLineToPoint:CGPointMake(100, 100)];
    //    }
    
    //方法二:通过UIBezierPath的工厂方法,去创建一个矩形
    return [UIBezierPath bezierPathWithRect:CGRectMake(100, 200, 100, 100)];
}
//内切圆
-(UIBezierPath *)inscribedCirclePath
{
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 200, 200)];
}
//内切椭圆
-(UIBezierPath *)inscribedEllipsePath
{
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 100, 200)];
}
//矩形圆角
-(UIBezierPath *)rectangleFilletPath
{
    return [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 200, 200, 200) cornerRadius:10];
    
    //方法二:通过UIBezierPath的工厂方法,把矩形的角画成圆角,可选角cornerRadii:size的width有用,height不知道为什么没用,如果有人知道,请告知
//    return [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 200, 200) byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(50, 0)];
}
//圆弧
-(UIBezierPath *)ArcPath
{
    //方法五:通过UIBezierPath的工厂方法,画圆弧
    /*
            @ (M_PI*1.5)
     
     
     @ (M_PI*1)   @ (M_PI*2)
     
     
            @ (M_PI*0.5)
     */
    /*
     center: 弧线中心点的坐标
     radius: 弧线所在圆的半径
     startAngle: 弧线开始的角度值
     endAngle: 弧线结束的角度值
     clockwise: 是否顺时针画弧线
     */
    return [UIBezierPath bezierPathWithArcCenter:self.view.center radius:100 startAngle:M_PI*1.5 endAngle:M_PI*1 clockwise:YES];
}
@end
