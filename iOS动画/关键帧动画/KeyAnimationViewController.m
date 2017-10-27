//
//  KeyAnimationViewController.m
//  iOS动画
//
//  Created by qing on 2017/7/21.
//  Copyright © 2017年 zhangxiaoqing. All rights reserved.
//

#import "KeyAnimationViewController.h"

@interface KeyAnimationViewController (){
    UIImageView * _ImageView;
}

@end

@implementation KeyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    _ImageView.backgroundColor = [UIColor orangeColor];
    _ImageView.image = [UIImage imageNamed:@"bear@2x"];
    [self.view addSubview:_ImageView];
    
    NSArray *nameArr = @[
                         @"按路径",@"贝塞尔曲线",@"抖动效果",@"路径法"
                        ];
    
    
    for (int i=0; i<nameArr.count; i++) {
        
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10+(80+10)*i, 400, 80, 30);
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
        
        //路径动画
        CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        keyFrameAnimation.duration = 4;
        keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
        NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
        NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
        NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
        NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
        NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
        NSArray *array = [NSArray arrayWithObjects:value1,value2,value3,value4,value5,value6,nil];
        keyFrameAnimation.repeatCount = MAXFLOAT;
        keyFrameAnimation.values =  array;
        [_ImageView.layer addAnimation:keyFrameAnimation forKey:@"keyFrameAnimation"];
        
        
    }else if (tag==1){
    
        //贝塞尔曲线绘制路径
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        keyAnimation.duration = 4;
        keyAnimation.timingFunction =
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 200, 200) cornerRadius:M_PI];
        keyAnimation.path = path.CGPath;
        [_ImageView.layer addAnimation:keyAnimation forKey:@"keyFrameAnimation"];
    
    }else if (tag==2){
    
        //抖动效果
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
        keyAnimation.duration = 1;
        NSValue *value1 = [NSNumber numberWithFloat:-M_PI/4];
        NSValue *value2 = [NSNumber numberWithFloat:M_PI/4];
        NSValue *value3 = [NSNumber numberWithFloat:-M_PI/4];
        keyAnimation.repeatCount = MAXFLOAT;
        keyAnimation.values = @[value1,value2,value3];
        [_ImageView.layer addAnimation:keyAnimation forKey:@"shakeAnimation"];
    
    }else{
    
        CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path,NULL,50.0,120.0);
        CGPathAddLineToPoint(path, NULL, 200, 120);
        CGPathAddArc(path, NULL, 200, 120, 100, M_PI,M_PI*4,YES);
        CGPathAddLineToPoint(path, NULL, 300, 300);
        anima.path = path;
        anima.duration = 3;
        [_ImageView.layer  addAnimation:anima forKey:@"pathAnimation"];
        
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
