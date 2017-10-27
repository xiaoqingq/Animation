//
//  ViewController.m
//  iOS动画
//
//  Created by qing on 2017/7/21.
//  Copyright © 2017年 zhangxiaoqing. All rights reserved.
//

#import "ViewController.h"
#import "AnimationViewController.h"
#import "AffineViewController.h"
#import "CATransitionViewController.h"
#import "KeyAnimationViewController.h"
#import "GroupAnimationViewController.h"
#import "ComprehensiveViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{

    NSArray *_dataSource;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUI];
    
    
    _dataSource = @[
                    @"UIView动画/基础动画",
                    @"CGAffine动画",
                    @"CATransition动画",
                    @"关键帧动画",
                    @"组动画",
                    @"开机动画"
                    ];
   

}

- (void)setUI{

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    tableView.rowHeight = 50;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataSource.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row==0) {
        AnimationViewController *ctrl = [[AnimationViewController alloc]init];
        ctrl.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ctrl animated:YES];
    }else if (indexPath.row==1){
        AffineViewController *affineCtrl = [[AffineViewController alloc]init];
        affineCtrl.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:affineCtrl animated:YES];
        
    }else if (indexPath.row==2){
        CATransitionViewController *affineCtrl = [[CATransitionViewController alloc]init];
        affineCtrl.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:affineCtrl animated:YES];

    }else if (indexPath.row==3){
        KeyAnimationViewController *affineCtrl = [[KeyAnimationViewController alloc]init];
        affineCtrl.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:affineCtrl animated:YES];

    }else if (indexPath.row==4){
    
        GroupAnimationViewController *groupCtrl = [[GroupAnimationViewController alloc]init];
        groupCtrl.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:groupCtrl animated:YES];
        
    }else{
    
        
        ComprehensiveViewController *groupCtrl = [[ComprehensiveViewController alloc]init];
        groupCtrl.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:groupCtrl animated:YES];

    
    }
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
