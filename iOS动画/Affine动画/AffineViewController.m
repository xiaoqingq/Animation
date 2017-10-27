//
//  AffineViewController.m
//  iOS动画
//
//  Created by qing on 2017/7/21.
//  Copyright © 2017年 zhangxiaoqing. All rights reserved.
//

#import "AffineViewController.h"

@interface AffineViewController (){
    UIImageView *_ImageView;
}

@end

@implementation AffineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    _ImageView.image = [UIImage imageNamed:@"bear@2x"];
    [self.view addSubview:_ImageView];
    
    NSArray *nameArr = @[
                         @[@"位移",@"缩放",@"旋转"],
                         @[@"组合",@"反转",@""],
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
        //位移
        _ImageView.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration:1.0f animations:^{
            _ImageView.transform = CGAffineTransformMakeTranslation(100, 100);
            
        }];

    }else if (tag==1){
    
        //缩放
        _ImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        [UIView animateWithDuration:1 animations:^{
            _ImageView.transform = CGAffineTransformMakeScale(2, 2);
        }];
    
    }else if (tag==2){
        //@"旋转"
        _ImageView.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration:1 animations:^{
            
            _ImageView.transform = CGAffineTransformMakeRotation(M_PI);

        }];
        
    }else if (tag==3){
        
        _ImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        [UIView animateWithDuration:3 animations:^{
            _ImageView.transform = CGAffineTransformMakeScale(2, 2);
            _ImageView.transform = CGAffineTransformMakeRotation(M_PI/2.0);
            _ImageView.transform = CGAffineTransformMakeTranslation(200, 200);

        }];
        
        
        
    }else if (tag==4){
        //反转
        _ImageView.transform = CGAffineTransformIdentity;
        [UIView animateWithDuration:1 animations:^{
//            _ImageView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2));
            _ImageView.transform = CGAffineTransformInvert(CGAffineTransformMakeTranslation(-100, -100));

        }];
        
    }else if (tag==5){
        
        
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
