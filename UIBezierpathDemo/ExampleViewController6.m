//
//  ExampleViewController6.m
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/26.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ExampleViewController6.h"
#import "AnimationWordView.h"

#define kSelfWidth self.view.bounds.size.width
#define kSelfHeight self.view.bounds.size.height

@interface ExampleViewController6 ()


@property(strong, nonatomic)AnimationWordView *animationWordView;

@end


@implementation ExampleViewController6

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.animationWordView];
    self.animationWordView.animationWord = @"Hello 文字.";
    self.animationWordView.animationDuration = 10;
    self.animationWordView.wordColor = [UIColor blueColor];
//    self.animationWordView.penImage = nil;
    
    
    [self.animationWordView startAnimation];
}

- (AnimationWordView *)animationWordView
{
    if (!_animationWordView) {
        _animationWordView = [[AnimationWordView alloc]initWithFrame:CGRectMake(20, 80, kSelfWidth-40, 100)];
        _animationWordView.backgroundColor = [UIColor yellowColor];
    }
    return _animationWordView;
}



@end
