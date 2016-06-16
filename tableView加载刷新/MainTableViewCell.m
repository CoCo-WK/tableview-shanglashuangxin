//
//  MainTableViewCell.m
//  tableView加载刷新
//
//  Created by W_K  MAC on 16/6/8.
//  Copyright © 2016年 W_K  MAC. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"MainTableViewCell" owner:nil options:nil];
    self = [array lastObject];
    [self layout];
    return self;
}
-(void)layout{
    
    CGFloat viewW = 320;
    for (int i = 1 ; i < 6; i++) {
        _button  = [[UIButton alloc]initWithFrame:CGRectMake (viewW/5 *(i-1), 0, viewW/5-1, 80)];
        [_button setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor colorWithRed:1 green:0.84 blue:0 alpha:1];
        _button.tag = i;
        [self addSubview:_button];
    }
    

}
  - (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
