//
//  AnimationWordView.h
//  UIBezierpathDemo
//
//  Created by 武建明 on 16/4/26.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>

@interface AnimationWordView : UIView

/**
 *  animationWord
 */
@property (strong, nonatomic) NSString *animationWord;

/**
 *  字的颜色
 */
@property (strong, nonatomic) UIColor *wordColor;
/**
 *  字的线条宽度,默认为1.0f
 */
@property (assign, nonatomic) CGFloat wordLineWidth;
/**
 *  word 字体和大小  用法参考:CTFontRef font = CTFontCreateWithName(CFSTR("STHeitiSC-Medium"), 40, NULL);
 */
@property (assign, nonatomic) CTFontRef wordFont;
/**
 *  动画时间
 */
@property (assign, nonatomic) CGFloat animationDuration;
/**
 *  笔的图片 如果新图的frame改变,需重新指定frame,否则笔的大小会依据原图的大小
 */
@property (strong, nonatomic) UIImage *penImage;
/**
 *  笔大小 默认为图片大小
 */
@property (assign, nonatomic) CGRect penFrame;
/**
 *  笔是否显示  默认:显示/NO
 */
@property (assign, nonatomic) BOOL penHidden;
/**
 *  动画是否重复播放 默认:YES
 */
@property (assign, nonatomic) BOOL animationPepeatly;

/**
 *  动画是否退回 默认:YES 当文字画完后,动画倒退播放
 */
@property (assign, nonatomic) BOOL animationAutoreverses;

/**
 *  开始动画
 */
- (void) startAnimation;

@end
