
##效果图:
![image](https://github.com/wjmwjmwb/GitImage/blob/master/CAShapeLayer%2BUIBezierPath.gif)

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
