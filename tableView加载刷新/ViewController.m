//
//  ViewController.m
//  tableView加载刷新
//
//  Created by W_K  MAC on 16/6/7.
//  Copyright © 2016年 W_K  MAC. All rights reserved.
//

#import "ViewController.h"
#import "RefreshTableViewController.h"
#import "MainTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    RefreshTableViewController *refresh;
}
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 50)];
    button.backgroundColor = [UIColor colorWithRed:1 green:0.84 blue:0 alpha:1];
    [button setTitle:@"下拉加载" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(butt) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100) style:UITableViewStylePlain];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.button.tag = 1;
    [cell.button addTarget:self action:@selector(butt1) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
-(void)butt1{
    
    refresh = [[RefreshTableViewController alloc]init];
    
    [self presentViewController:refresh animated:YES completion:nil];
}
-(void)butt{
    
    refresh = [[RefreshTableViewController alloc]init];
    
    [self presentViewController:refresh animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
