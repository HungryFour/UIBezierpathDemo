


//
//  ExampleViewController4.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/25.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ExampleViewController4.h"

#define kSelfWidth self.view.bounds.size.width
#define kSelfHeight self.view.bounds.size.height

@interface ExampleViewController4 ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (strong, nonatomic)UISegmentedControl *segmentedControl;

@end

@implementation ExampleViewController4
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
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"二次贝塞尔曲线", @"三次贝塞尔曲线"]];
        _segmentedControl.frame = CGRectMake(10, 80, kSelfWidth-20, 40);
        [_segmentedControl addTarget:self action:@selector(segmentedControlSelected:) forControlEvents:UIControlEventValueChanged];;
    }
    return _segmentedControl;
}


- (UIBezierPath *)twiceBezierPath
{
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(200, 200)];
    //画二次贝塞尔曲线
    //QuadCurveToPoint:终点
    //controlPoint:经过
    [path addQuadCurveToPoint:CGPointMake(50, 300) controlPoint:CGPointMake(50, 400)];

    return path;
}
- (UIBezierPath *)cubicBezierPath
{
    //画三次贝塞尔曲线
    //CurveToPoint:终点
    //controlPoint1:经过
    //controlPoint2:经过
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(200, 200)];
    [path addCurveToPoint:CGPointMake(50, 300) controlPoint1:CGPointMake(100, 400) controlPoint2:CGPointMake(150, 300)];

    return path;

}
- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [[CAShapeLayer alloc]init];
        _shapeLayer.path = self.twiceBezierPath.CGPath;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    }
    return _shapeLayer;
}

- (void)segmentedControlSelected:(UISegmentedControl *)sc
{
    if (sc.selectedSegmentIndex == 0) {
        _shapeLayer.path = self.twiceBezierPath.CGPath;
    }else{
        _shapeLayer.path = self.cubicBezierPath.CGPath;
    }
}
@end
