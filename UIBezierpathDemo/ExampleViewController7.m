//
//  ExampleViewController7.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 2016/11/24.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ExampleViewController7.h"
#define kSelfWidth self.view.bounds.size.width
#define kSelfHeight self.view.bounds.size.height
#import "NestCircleProgressBar.h"

@interface ExampleViewController7 ()
@property (strong, nonatomic)UIButton *button;
@property (strong, nonatomic)NestCircleProgressBar *progressView;
@end

@implementation ExampleViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.button];
    [self.view addSubview:self.progressView];
}

//-(UISlider *)slider
//{
//    if (!_slider) {
//        _slider = [[UISlider alloc]initWithFrame:CGRectMake(80, kSelfHeight-100, (kSelfWidth-160), 10)];
//        _slider.minimumValue = 0;
//        _slider.maximumValue = 1;
//        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
//    }
//    return _slider;
//}
- (UIButton *)button{

    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(80, kSelfHeight-100, (kSelfWidth-160), 30);
        _button.backgroundColor = [UIColor redColor];
        [_button addTarget:self action:@selector(dealBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
- (NestCircleProgressBar *)progressView{
    if (!_progressView) {
        _progressView = [[NestCircleProgressBar alloc]initWithFrame:CGRectMake(75, 100, kSelfWidth-150, kSelfWidth-150)];
        _progressView.backgroundColor = [UIColor blackColor];
    }
    return _progressView;
}
- (void)dealBtn{
    [self.progressView setFirstPercentage:0.009 secondPercentage:0.99 thirdPercentage:0.001];
}
- (void)sliderValueChanged:(UISlider *)slider
{
//    self.progressView.progress = slider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
