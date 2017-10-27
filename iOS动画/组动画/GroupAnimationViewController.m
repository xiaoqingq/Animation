//
//  GroupAnimationViewController.m
//  iOS动画
//
//  Created by qing on 2017/7/21.
//  Copyright © 2017年 zhangxiaoqing. All rights reserved.
//

#import "GroupAnimationViewController.h"

@interface GroupAnimationViewController (){
    UIImageView * _ImageView;
}

@end

@implementation GroupAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    _ImageView.backgroundColor = [UIColor orangeColor];
    _ImageView.image = [UIImage imageNamed:@"bear@2x"];
    [self.view addSubview:_ImageView];
    
    NSArray *nameArr = @[
                         @"多个动画同时",@"多个动画连续"
                         ];
    
    
    for (int i=0; i<nameArr.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10+(150+30)*i, 400, 150, 30);
        [button setTitle:nameArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }

}


- (void)btnAction:(UIButton *)button{

    NSInteger tag = button.tag;
    
    if (tag==0) {
        
        
        //关键帧动画
        CAKeyframeAnimation *keyFrameAnimation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100,200)];
        NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200,200)];
        keyFrameAnimation1.values = @[value1,value2];
        
        //转场动画
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;//设置动画的类型
        transition.subtype = kCATransitionFromRight; //设置动画的方向
        
        //基础动画-旋转动画
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        basicAnimation.toValue = [NSNumber numberWithFloat:M_PI/2.0];
        
        //基础动画-缩放
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.toValue = [NSNumber numberWithFloat:2.0];
        
        
        CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
        groupAnimation.duration = 2;
        groupAnimation.repeatCount = MAXFLOAT;
        groupAnimation.animations = @[keyFrameAnimation1,transition,basicAnimation,scaleAnimation];
        [_ImageView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
        
        
        
    }else{
    
        CFTimeInterval currentTime = CACurrentMediaTime();
        
        //移动
        CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
        animation1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
        animation1.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 200)];
        animation1.duration = 2;
        animation1.beginTime = currentTime;
        [_ImageView.layer addAnimation:animation1 forKey:@"basicAnimation"];
        
        
        
        //缩放动画
        CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation2.fromValue = [NSNumber numberWithFloat:0.8];
        animation2.toValue = [NSNumber numberWithFloat:2];
        animation2.beginTime = currentTime+2;
        animation2.duration = 2;
        [_ImageView.layer addAnimation:animation2 forKey:@"scaleAnimation"];
        
        CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation3.fromValue = [NSNumber numberWithFloat:0];
        animation3.toValue = [NSNumber numberWithFloat:M_PI*5];
        animation3.duration = 1;
        animation3.beginTime = currentTime+4;
        [_ImageView.layer addAnimation:animation3 forKey:@"rotationAnimation"];
        
        
    }
    
    

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
