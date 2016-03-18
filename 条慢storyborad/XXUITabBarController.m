//
//  XXUITabBarController.m
//  条慢storyborad
//
//  Created by 千锋 on 16/3/11.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "XXUITabBarController.h"
#import "ComicViewController.h"

@interface XXUITabBarController ()

@end

@implementation XXUITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    ComicViewController*comic=[[ComicViewController alloc] init];
    self.view.window.rootViewController=comic;
    NSArray*items=self.tabBar.items;
    UITabBarItem*item0=items[0];
    [item0 setSelectedImage:[[UIImage imageNamed:@"tiaoman_d"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
     UITabBarItem*item1=items[1];
   
    [item1 setSelectedImage:[[UIImage imageNamed:@"faxian_d"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
     UITabBarItem*item2=items[2];
    [item2 setSelectedImage:[[UIImage imageNamed:@"huiben_d"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UITabBarItem *item3=items[3];
    [item3 setSelectedImage:[[UIImage imageNamed:@"wode_d"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
 //   UIApplication*app=[UIApplication sharedApplication];
    
    
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
