//
//  ComicViewController.m
//  条慢storyborad
//
//  Created by 千锋 on 16/3/11.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "ComicViewController.h"
#import "ManManAPI.h"
#import "UIImageView+AFNetworking.h"
#import "ComicModel.h"
#import "MJRefresh.h"

@interface ComicViewController ()
@property(nonatomic,strong)NSMutableArray*dataArray;

@end

@implementation ComicViewController


-(NSMutableArray*)dataArray
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc] init];
        
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData:10 startidx:0];
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getData:10 startidx:0];
    }];
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self getData:10 startidx:(int)self.dataArray.count];
    }];
}
#pragma mark-网络请求
-(void)getData:(int)pagesize startidx:(int)startIdex
{
    //1.创建会话模式
    NSURLSessionConfiguration*config=[NSURLSessionConfiguration defaultSessionConfiguration];
    //2.创建session
    NSURLSession*session=[NSURLSession sessionWithConfiguration:config];
    //3.创建URL
    NSString * urlStr = [Comic_API stringByAppendingFormat:@"&pageSize=%d&startIdx=%d",pagesize, startIdex];
    NSURL *url=[NSURL URLWithString:urlStr];
    //创建请求对象
    NSMutableURLRequest*request=[NSMutableURLRequest requestWithURL:url];
//    //设置请求方式
//    request.HTTPMethod=@"POST";
//    NSString*str=@"username=15300022703&password=123456";
//    NSData*data=[str dataUsingEncoding:NSUTF8StringEncoding];
//    request.HTTPBody=data;
//    request.timeoutInterval=20;
    //创建任务
    NSURLSessionDataTask*task=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if ([self.tableView.mj_header isRefreshing]) {
            [self.dataArray removeAllObjects];
            [self.tableView.mj_header endRefreshing];
        }
        NSArray*array=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary*dic in array) {
            ComicModel*model=[[ComicModel alloc] initWithDict:dic];
            [self.dataArray addObject:model];
        }
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    }];
        
    [task resume];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        ComicModel*model=self.dataArray[indexPath.row];
        
    }
    return cell;
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
