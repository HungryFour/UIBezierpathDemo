//
//  ProgressBarView.h
//  UIBezierpathDemo
//
//  Created by 武建明 on 2016/12/2.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {

    ProgressBarTypeLine = 0,//横条
    ProgressBarTypeCircle = 1,//单环圆

}ProgressBarType;

@interface ProgressBarView : UIView

@property (assign, nonatomic)CGFloat progress;


/**
 进度条样式
 */
@property (assign, nonatomic)ProgressBarType barType;

/**
 低层颜色
 */
@property (strong, nonatomic)UIColor *barBackgroundColor;

/**
 进度条颜色
 */
@property (strong, nonatomic)UIColor *barColor;

/**
 是否显示渐变色
 */
@property (nonatomic, assign)BOOL showsGradientColor;

/**
 线宽
 */
@property (nonatomic, assign)CGFloat lineWidth;

/**
 渐变色颜色
 */
@property (nonatomic, strong)NSArray *gradientColors;

- (instancetype)initWithFrame:(CGRect)frame
              progressBarType:(ProgressBarType)barType;


@end
