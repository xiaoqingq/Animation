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
}

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    _ImageView.image = [UIImage imageNamed:@"bear@2x"];
    [self.view addSubview:_ImageView];
    
    NSArray *nameArr = @[
                         @[@"fade",@"moveIn",@"push"],
                         @[@"reveal",@"cube",@"suck"],
                          @[@"oglFlip",@"ripple",@"Curl"],
                          @[@"UnCurl",@"caOpen",@"caClose"],
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
    
    
    
}


- (void)btnAction:(UIButton *)button{
    
    NSInteger tag = button.tag;
    
    if (tag==0) {

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
        
    }else if (tag==3){
        
        
    }else if (tag==4){
       
        
    }else if (tag==5){
        
        
    }else if (tag==6){
        
        
    }else if (tag==7){
        
        
    }else if (tag==8){
        
        
    }else if (tag==9){
        
        
    }else if (tag==10){
        
        
    }else if (tag==11){
        
        
    }else{
        
        
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
