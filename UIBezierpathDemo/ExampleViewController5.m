//
//  ExampleViewController5.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/25.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ExampleViewController5.h"
#import "ProgressView.h"

#define kSelfWidth self.view.bounds.size.width
#define kSelfHeight self.view.bounds.size.height

@interface ExampleViewController5 ()

@property (strong, nonatomic)UISegmentedControl *segmentedControl;

@property (strong, nonatomic)UISlider *slider;

@property (strong, nonatomic)ProgressView *progressView;

@end

@implementation ExampleViewController5

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.segmentedControl];
    [self.view addSubview:self.slider];
}

#pragma mark - Property
- (UISegmentedControl *)segmentedControl
{
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"横条",@"单圆环",@"双圆环",@"三角形",@"正方形",@"五角星"]];
        _segmentedControl.frame = CGRectMake(10, 80, kSelfWidth-20, 40);
        [_segmentedControl addTarget:self action:@selector(selectProgressType:) forControlEvents:UIControlEventValueChanged];;
    }
    return _segmentedControl;
}
-(UISlider *)slider
{
    if (!_slider) {
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(80, kSelfHeight-100, (kSelfWidth-160), 10)];
        _slider.minimumValue = 0;
        _slider.maximumValue = 1;
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}
- (ProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[ProgressView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
        _progressView.progressViewType = ProgressViewType3;
        _progressView.backgroundColor = [UIColor redColor];
    }
    return _progressView;
}



- (void)selectProgressType:(UISegmentedControl *)sc
{
    [_slider setValue:0 animated:YES];
    self.progressView.progressViewType = (ProgressViewType)sc.selectedSegmentIndex+1;
}

- (void)sliderValueChanged:(UISlider *)slider
{
    self.progressView.progress = slider.value;
}




@end
