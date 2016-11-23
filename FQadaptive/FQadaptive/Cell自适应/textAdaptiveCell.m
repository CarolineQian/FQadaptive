//
//  textAdaptiveCell.m
//  FQadaptive
//
//  Created by 冯倩 on 2016/10/31.
//  Copyright © 2016年 冯倩. All rights reserved.
//

#import "textAdaptiveCell.h"

@implementation textAdaptiveCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    _contentLabel.layer.masksToBounds = YES;
    _contentLabel.layer.cornerRadius = 5;
    _contentLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
