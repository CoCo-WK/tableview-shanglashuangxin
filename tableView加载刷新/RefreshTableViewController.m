//
//  RefreshTableViewController.m
//  tableView加载刷新
//
//  Created by W_K  MAC on 16/6/8.
//  Copyright © 2016年 W_K  MAC. All rights reserved.
//

#import "RefreshTableViewController.h"

@interface RefreshTableViewController ()
{
    NSMutableArray *timeArray;
    UIRefreshControl *refresh;
}
@end

@implementation RefreshTableViewController

@synthesize refresh;
@synthesize timeArray;

- (void)viewDidAppear:(BOOL)animated
{
    self.tableView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //为了防止tableview上边出现黑条，设置背景颜色为白色：
    [[[UIApplication sharedApplication] keyWindow] setBackgroundColor:[UIColor whiteColor]];
    
    
 //UIRefreshControl目前只能用于UITableViewController，我写时后用的是viewCtntrol  发现调用不了 self.refreshControl 属性
    self.timeArray = [[NSMutableArray alloc]init];
    [self setbeginRefreshing];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

#pragma 开始刷新函数
- (void)setbeginRefreshing
{
    refresh = [[UIRefreshControl alloc]init];
    //刷新图形颜色
    refresh.frame = CGRectMake(self.view.frame.origin.x
                               , self.view.frame.size.height, self.view.frame.size.width, 50);
    refresh.tintColor = [UIColor lightGrayColor];
    //刷新的标题
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉加载"];
    // UIRefreshControl 会触发一个UIControlEventValueChanged事件，通过监听这个事件，我们就可以进行类似数据请求的操作了
    [refresh addTarget:  self action:@selector(refreshTableviewAction:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl =refresh;
    
}

-(void)refreshTableviewAction:(UIRefreshControl *)refreshs
{
    
    
    if (refreshs.refreshing) {
        refreshs.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在加载"];
        [self performSelector:@selector(refershData) withObject:nil afterDelay:2];
    }
    
    
}
-(void)refershData
{
    
    NSString *syseTiem = nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //创建的时间格式
    syseTiem = [formatter stringFromDate:[NSDate date]];
    
    NSString *lastUpdated = [NSString stringWithFormat:@"上一次加载时间为 %@", [formatter stringFromDate:[NSDate date]]];
    
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated] ;
    
    [self.timeArray addObject:syseTiem];
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return self.timeArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
    }

    cell.textLabel.text = @"技术部";
    cell.detailTextLabel.text = [self.timeArray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"2"];
   
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
