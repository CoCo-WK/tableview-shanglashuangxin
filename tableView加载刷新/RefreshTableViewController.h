//
//  RefreshTableViewController.h
//  tableView加载刷新
//
//  Created by W_K  MAC on 16/6/8.
//  Copyright © 2016年 W_K  MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshTableViewController : UITableViewController
@property (strong,nonatomic)NSMutableArray *timeArray;
@property (strong,nonatomic)UIRefreshControl *refresh;
- (void)setbeginRefreshing;
@end
