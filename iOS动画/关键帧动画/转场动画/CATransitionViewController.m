//
//  CATransitionViewController.m
//  iOS动画
//
//  Created by qing on 2017/7/21.
//  Copyright © 2017年 zhangxiaoqing. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController (){
    UIImageView *_ImageView;
    NSInteger _index;
}

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    _ImageView.backgroundColor = [UIColor orangeColor];
    _ImageView.image = [UIImage imageNamed:@"bear@2x"];
    [self.view addSubview:_ImageView];
    
    NSArray *nameArr = @[
                         @[@"fade",@"moveIn",@"push"],
                         @[@"reveal",@"cube",@"suck"],
                          @[@"oglFlip",@"ripple",@"Curl"],
                          @[@"UnCurl",@"caOpen",@"caClose"],
                         ];
    
    
    for (int i=0; i<4; i++) {
        
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
    
    
    
}


- (void)btnAction:(UIButton *)button{
    
    NSInteger tag = button.tag;
    
    if (tag==0) {

        [self changeView:YES];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromRight;
        transition.duration = 1;
        [_ImageView.layer addAnimation:transition forKey:@"fadeAnimation"];
        
    }else if (tag==1){
        
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionMoveIn;//设置动画的类型
        transition.subtype = kCATransitionFromRight; //设置动画的方向
        transition.duration = 1;
        [_ImageView.layer addAnimation:transition forKey:@"fadeAnimation"];

        
    }else if (tag==2){
        
        [self changeView:YES];

        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;//设置动画的类型
        transition.subtype = kCATransitionFromRight; //设置动画的方向
        transition.duration = 1;
        [_ImageView.layer addAnimation:transition forKey:@"fadeAnimation"];
    }else if (tag==3){
        
        [self changeView:YES];

        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionReveal;//设置动画的类型
        transition.subtype = kCATransitionFromRight; //设置动画的方向
        transition.duration = 1;
        [_ImageView.layer addAnimation:transition forKey:@"fadeAnimation"];

        
    }else if (tag==4){
       
        //cube
        [self changeView:YES];
        CATransition *anima = [CATransition animation];
        anima.type = @"cube";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        
        [_ImageView.layer addAnimation:anima forKey:@"cubeAnimation"];

        
    }else if (tag==5){
        
        //suck
        [self changeView:YES];

        CATransition *anima = [CATransition animation];
        anima.type = @"suckEffect";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        [_ImageView.layer addAnimation:anima forKey:@"suckAnimation"];

        
    }else if (tag==6){
        
        //反转
        [self changeView:YES];
        CATransition *anima = [CATransition animation];
        anima.type = @"oglFlip";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        [_ImageView.layer addAnimation:anima forKey:@"oglFlipAnimation"];

        
    }else if (tag==7){
        
        //波纹
        [self changeView:YES];
        CATransition *anima = [CATransition animation];
        anima.type = @"rippleEffect";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        
        [_ImageView.layer addAnimation:anima forKey:@"rippleEffectAnimation"];

        
    }else if (tag==8){
        
        //翻书
        [self changeView:YES];
        CATransition *anima = [CATransition animation];
        anima.type = @"pageCurl";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        
        [_ImageView.layer addAnimation:anima forKey:@"pageCurlAnimation"];
        
    }else if (tag==9){
        
        //合书
        [self changeView:YES];
        CATransition *anima = [CATransition animation];
        anima.type = @"pageUnCurl";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        
        [_ImageView.layer addAnimation:anima forKey:@"pageUnCurlAnimation"];

        
    }else if (tag==10){
        
        //打开照相机
        [self changeView:YES];
        CATransition *anima = [CATransition animation];
        anima.type = @"cameraIrisHollowOpen";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        
        [_ImageView.layer addAnimation:anima forKey:@"cameraIrisHollowOpenAnimation"];
        
    }else if (tag==11){
        
        //闭合照相机
        [self changeView:YES];
        CATransition *anima = [CATransition animation];
        anima.type = @"cameraIrisHollowClose";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 1.0f;
        
        [_ImageView.layer addAnimation:anima forKey:@"cameraIrisHollowCloseAnimation"];

        
    }else{
        
        
    }
    
}



    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)changeView : (BOOL)isUp{
    if (_index>3) {
        _index = 0;
    }
    if (_index<0) {
        _index = 3;
    }
    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor], nil];
    
    _ImageView.backgroundColor = [colors objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
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
