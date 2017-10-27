//
//  ComprehensiveViewController.m
//  iOS动画
//
//  Created by qing on 2017/7/22.
//  Copyright © 2017年 zhangxiaoqing. All rights reserved.
//

#import "ComprehensiveViewController.h"
#import "UIColor+Hex.h"

#define  paddingSpace 15

@interface ComprehensiveViewController (){
    UIView *_bgView;
}

@property (strong, nonatomic) CAShapeLayer *circleLayer;
@property (strong, nonatomic) CAShapeLayer *triangleLayer;
@property (strong, nonatomic) CAShapeLayer *redRectangleLayer;
@property (strong, nonatomic) CAShapeLayer *blueRectangleLayer;
@property (strong, nonatomic) CAShapeLayer *waveLayer;



@end

static const NSTimeInterval KAnimationDuration = 0.5;
static const NSTimeInterval KAnimationBeginTime = 0.0;


@implementation ComprehensiveViewController




- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bgView];
    _bgView.backgroundColor = [UIColor yellowColor];
    
    //圆
    [_bgView.layer addSublayer:self.circleLayer];
    [self circleAnimation];
    
    //三角形
    [_bgView.layer addSublayer:self.triangleLayer];
    [self triangleAnimation];
    
    [self rotateAnimation];


}


- (void)rotateAnimation{
   

//    _bgView.layer.anchorPoint = CGPointMake(0, 0);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.beginTime = KAnimationDuration*8;
    rotationAnimation.toValue = @(M_PI * 2);
    rotationAnimation.duration = 0.45;
//    rotationAnimation.removedOnCompletion = true;
    [_triangleLayer addAnimation:rotationAnimation forKey:nil];
    

}


- (void)circleAnimation{

    UIBezierPath * circleSmallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50,50, 0.0, 0.0)];
    UIBezierPath *circleBigPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
    //创建从小至大的圆
    CABasicAnimation *circleAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    circleAnimation.fromValue = (__bridge id _Nullable)(circleSmallPath.CGPath);
    circleAnimation.toValue = (__bridge id _Nullable)(circleBigPath.CGPath);
    circleAnimation.beginTime = KAnimationBeginTime;
    circleAnimation.duration = KAnimationDuration;
    circleAnimation.fillMode = kCAFillModeForwards;
    circleAnimation.removedOnCompletion = NO;
    [self.circleLayer addAnimation:circleAnimation forKey:@"circleAnimation"];
    
    //圆的挤压效果
    UIBezierPath * circleVerticalSquishPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 2.5 , 100, 95)];
    UIBezierPath * circleHorizontalSquishPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 2.5, 95, 95.0)];

    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation1.fromValue = (__bridge id _Nullable)(circleBigPath.CGPath);
    animation1.toValue = (__bridge id _Nullable)(circleVerticalSquishPath.CGPath);
    animation1.beginTime = circleAnimation.duration+KAnimationBeginTime;
    animation1.duration = KAnimationDuration;

    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation2.fromValue = (__bridge id _Nullable)(circleVerticalSquishPath.CGPath);
    animation2.toValue = (__bridge id _Nullable)(circleHorizontalSquishPath.CGPath);
    animation2.beginTime = KAnimationBeginTime+animation1.duration;
    animation2.duration = KAnimationDuration;

    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation3.fromValue = (__bridge id _Nullable)(circleHorizontalSquishPath.CGPath);
    animation3.toValue = (__bridge id _Nullable)(circleVerticalSquishPath.CGPath);
    animation3.beginTime = animation2.beginTime + animation2.duration;
    animation3.duration = KAnimationDuration;

    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation4.fromValue = (__bridge id _Nullable)(circleVerticalSquishPath.CGPath);
    animation4.toValue = (__bridge id _Nullable)(circleBigPath.CGPath);
    animation4.beginTime = animation3.beginTime + animation3.duration;
    animation4.duration = KAnimationDuration;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1,animation2,animation3,animation4];
    groupAnimation.duration = 4 * KAnimationDuration;
    groupAnimation.repeatCount = 1;
    [_circleLayer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
    
    
}

- (void)triangleAnimation{

    
    UIBezierPath *smallTrianglePath = [[UIBezierPath alloc] init];
    [smallTrianglePath moveToPoint:CGPointMake(5.0 + paddingSpace, 100-paddingSpace)];
    [smallTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
    [smallTrianglePath addLineToPoint:CGPointMake(50, 100-paddingSpace)];
    [smallTrianglePath closePath];
    

    
    UIBezierPath * leftTrianglePath = [[UIBezierPath alloc] init];
    leftTrianglePath = [[UIBezierPath alloc] init];
    [leftTrianglePath moveToPoint:CGPointMake(5.0, 100-paddingSpace)];
    [leftTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
    [leftTrianglePath addLineToPoint:CGPointMake(50.0, 100-paddingSpace)];
    [leftTrianglePath closePath];

    
    UIBezierPath * rightTrianglePath = [[UIBezierPath alloc] init];
    rightTrianglePath = [[UIBezierPath alloc] init];
    [rightTrianglePath moveToPoint:CGPointMake(5.0, 100-paddingSpace)];
    [rightTrianglePath addLineToPoint:CGPointMake(50.0, 12.5 + paddingSpace)];
    [rightTrianglePath addLineToPoint:CGPointMake(100, 100-paddingSpace)];
    [rightTrianglePath closePath];

    UIBezierPath *topTrianglePath = [[UIBezierPath alloc] init];
    [topTrianglePath moveToPoint:CGPointMake(0, 100-paddingSpace)];
    [topTrianglePath addLineToPoint:CGPointMake(50,  -paddingSpace)];
    [topTrianglePath addLineToPoint:CGPointMake(100, 100-paddingSpace)];
    [topTrianglePath closePath];
    
    
    CABasicAnimation *triangleAnimationLeft = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationLeft.fromValue = (__bridge id _Nullable)(smallTrianglePath.CGPath);
    triangleAnimationLeft.toValue = (__bridge id _Nullable)(leftTrianglePath.CGPath);
    triangleAnimationLeft.beginTime = KAnimationBeginTime+KAnimationDuration*5;
    triangleAnimationLeft.duration = KAnimationDuration;

    
    CABasicAnimation *triangleAnimationRight = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationRight.fromValue = (__bridge id _Nullable)(leftTrianglePath.CGPath);
    triangleAnimationRight.toValue = (__bridge id _Nullable)(rightTrianglePath.CGPath);
    triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration;
    triangleAnimationRight.duration = KAnimationDuration;
    
    //    top
    CABasicAnimation *triangleAnimationTop = [CABasicAnimation animationWithKeyPath:@"path"];
    triangleAnimationTop.fromValue = (__bridge id _Nullable)(rightTrianglePath.CGPath);
    triangleAnimationTop.toValue = (__bridge id _Nullable)(topTrianglePath.CGPath);
    triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration;
    triangleAnimationTop.duration = KAnimationDuration;
    

    
   //    group
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[triangleAnimationLeft, triangleAnimationRight,triangleAnimationTop];
    animationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [_triangleLayer addAnimation:animationGroup forKey:nil];

}








- (CAShapeLayer *)circleLayer{
    if (_circleLayer==nil) {
        _circleLayer = [[CAShapeLayer alloc]init];
        _circleLayer.fillColor = [UIColor colorWithHexString:@"#da70d6"].CGColor;

    }
    return _circleLayer;
}

- (CAShapeLayer *)triangleLayer{
    if (_triangleLayer==nil) {
        _triangleLayer = [[CAShapeLayer alloc]init];
        _triangleLayer.fillColor = [UIColor colorWithHexString:@"#da70d6"].CGColor;
        _triangleLayer.strokeColor = [UIColor colorWithHexString:@"#da70d6"].CGColor;
        _triangleLayer.lineWidth = 7.0;
        _triangleLayer.lineCap = kCALineCapRound;
        _triangleLayer.lineJoin = kCALineJoinRound;

    }
    return _triangleLayer;
}

- (CAShapeLayer *)redRectangleLayer{
    if (_redRectangleLayer==nil) {
        _redRectangleLayer = [[CAShapeLayer alloc]init];
    }
    return _redRectangleLayer;
}

- (CAShapeLayer *)blueRectangleLayer{
    if (_blueRectangleLayer==nil) {
        _blueRectangleLayer = [[CAShapeLayer alloc]init];
    }
    return _blueRectangleLayer;
}

- (CAShapeLayer *)waveLayer{
    if (_waveLayer==nil) {
        _waveLayer = [[CAShapeLayer alloc]init];
    }
    return _waveLayer;
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
