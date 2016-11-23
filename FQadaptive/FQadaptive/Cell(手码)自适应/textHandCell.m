//
//  textHandCell.m
//  FQadaptive
//
//  Created by 冯倩 on 2016/11/3.
//  Copyright © 2016年 冯倩. All rights reserved.
//

#import "textHandCell.h"

@implementation textHandCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor whiteColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_contentLabel];
    }
    return self;
}

- (void)dealloc
{
    _contentLabel = nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _contentLabel.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height);
}

@end
