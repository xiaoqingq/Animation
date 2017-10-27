//
//  AnimationViewController.m
//  iOS动画
//
//  Created by qing on 2017/7/21.
//  Copyright © 2017年 zhangxiaoqing. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController (){
    UIImageView *_ImageView;

}

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 50, 50)];
    _ImageView.image = [UIImage imageNamed:@"bear@2x"];
    [self.view addSubview:_ImageView];
    
    NSArray *nameArr = @[
                         @[@"位移",@"透明度",@"缩放"],
                         @[@"旋转",@"背景色",@""],
                         ];
    
    for (int i=0; i<2; i++) {
        
        for (int j=0; j<3; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10+(100+30)*j, 400+(30+10)*i, 100, 30);
            [button setTitle:nameArr[i][j] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            button.tag = 3*i+j;
            [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
    }
    
    
    
    //1、UIView动画
    [self UIUiewAnimation];
    
    
    
    
}


- (void)UIUiewAnimation{
    //1、UIView动画
    [UIView animateWithDuration:0.35 animations:^{
        
        _ImageView.frame = CGRectMake(200, 200, 50, 50);
    }];
    
    //2、
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    _ImageView.frame = CGRectMake(200, 200, 50, 50);
    [UIView commitAnimations];
    
    
}


//基础动画

//基础动画主要提供了对于CALayer对象中的可变属性进行简单动画的操作。比如：位移、透明度、缩放、旋转、背景色等等。

- (void)btnAction:(UIButton *)button{

    NSInteger tag = button.tag;
    
    if (tag==0) {
        
        //1 位移
        
        //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
        animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
        animation.duration = 1;
        [_ImageView.layer addAnimation:animation forKey:@"positionAnimation"];
        
        
    }else if (tag==1){
    
        //2 透明度
        
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
        anima.fromValue = [NSNumber numberWithFloat:1.0f];
        anima.toValue = [NSNumber numberWithFloat:0.2f];
        anima.duration = 1.0f;
        [_ImageView.layer addAnimation:anima forKey:@"opacityAniamtion"];

    
    }else if (tag==2){
    
        //缩放
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.toValue = [NSNumber numberWithInt:2];
        animation.duration = 2;
        [_ImageView.layer addAnimation:animation forKey:@"scaleAniamtion"];
        
    }else if (tag==3){
        
        //旋转
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.toValue = [NSNumber numberWithFloat:M_PI/2.0];
        animation.duration = 2;
        [_ImageView.layer addAnimation:animation forKey:@"rotateAniamtion"];

        
    }else if (tag==4){
        
        //背景色
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
        anima.toValue =(id) [UIColor greenColor].CGColor;
        anima.duration = 2.0f;
        [_ImageView.layer addAnimation:anima forKey:@"backgroundAnimation"];

        
    }else if (tag==6){
        
        
        
        
    }



}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
