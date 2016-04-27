
##输入文字效果图:
![image](https://github.com/wjmwjmwb/GitImage/blob/master/CAShapeLayer%2BUIBezierPath%20%E6%96%87%E5%AD%97.gif)
##代码
```java 

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

```
##进度条效果图:
![image](https://github.com/wjmwjmwb/GitImage/blob/master/CAShapeLayer%2BUIBezierPath%20%E8%BF%9B%E5%BA%A6%E6%9D%A1.gif)
##进度条代码
```java 
 //横线路径
- (UIBezierPath *)horizontalLinePath
{
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height/2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height/2)];
    [path stroke];
    return path;
}
//三角形
- (UIBezierPath *)trianglePath
{
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(self.bounds.size.width/2, 0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path closePath];
    return path;
}
//正方形
- (UIBezierPath *)squarePath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    [path closePath];
    return path;
}

//圆环路径
- (UIBezierPath *)circlePath
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.radius, self.radius) radius:self.radius - 5 startAngle:- M_PI_2 endAngle:- M_PI_2 + 2 * M_PI clockwise:YES];
    return path;
}
//五角星路径
- (UIBezierPath *)pentagrammePath
{
    UIBezierPath *path = [[UIBezierPath alloc]init];
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(kSelfWidth/2, 0)];
    [path addLineToPoint:CGPointMake(kSelfWidth*13/16, kSelfHeight*19/20)];
    [path addLineToPoint:CGPointMake(0, kSelfHeight*29/80)];
    [path addLineToPoint:CGPointMake(kSelfWidth, kSelfHeight*29/80)];
    [path addLineToPoint:CGPointMake(kSelfWidth*3/16, kSelfHeight*19/20)];
    [path closePath];
    return path;
}
```
