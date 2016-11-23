//
//  FQImageAndTextController.m
//  FQadaptive
//
//  Created by 冯倩 on 2016/10/26.
//  Copyright © 2016年 冯倩. All rights reserved.
//

#import "FQImageAndTextController.h"

@interface FQImageAndTextController ()

@end

@implementation FQImageAndTextController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 100, 0)];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    // 富文本用法3 - 图文混排
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
    
    // 第一段
    NSAttributedString *substring1 = [[NSAttributedString alloc] initWithString:@"呵呵呵呵呵呵呵\n"];
    [string appendAttributedString:substring1];
    
    // 第二段：图片
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"background.jpg"];
    attachment.bounds = CGRectMake(0, 0, 16, 16);
    NSAttributedString *subtring2 = [NSAttributedString attributedStringWithAttachment:attachment];
    [string appendAttributedString:subtring2];
    
    // 第三段
    NSAttributedString *substring3 = [[NSAttributedString alloc] initWithString:@"\n啦啦啦拉拉阿拉啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦"];
    [string appendAttributedString:substring3];
    
    label.attributedText = string;
    
    label.numberOfLines = 0;
    [label sizeToFit];
    
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
