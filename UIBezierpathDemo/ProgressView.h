//
//  ProgressView.h
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/26.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    ProgressViewType1 = 1,//横条
    ProgressViewType2 = 2,//单环圆
    ProgressViewType3 = 3,//双环圆
    ProgressViewType4 = 4,//三角形
    ProgressViewType5 = 5,//正方形
    ProgressViewType6 = 6,//五角星
    
}ProgressViewType;

@interface ProgressView : UIView

@property (assign, nonatomic)CGFloat progress;

@property (assign, nonatomic)ProgressViewType progressViewType;

- (instancetype)initWithFrame:(CGRect)frame;


@end
