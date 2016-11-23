//
//  ViewController.m
//  FQadaptive
//
//  Created by 冯倩 on 2016/10/26.
//  Copyright © 2016年 冯倩. All rights reserved.
//

#import "ViewController.h"
#import "FQImageAndTextController.h"    //label图文混排
#import "FQWidthAndHeightController.h"  //label宽高自适应
#import "FQCellAdaptiveController.h"    //Cell(Xib)自适应
#import "FQhandAdaptController.h"       //Cell(手码)自适应

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mainTableView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64) style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [self.view addSubview:_mainTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    //cell内容
    NSString *str;
    switch (indexPath.row)
    {
        case 0:
            str = @"Label图文混排";
            break;
        case 1:
            str = @"宽高自适应";
            break;
        case 2:
            str = @"Cell(Xib)文字自适应";
            break;
        case 3:
            str = @"Cell(手码)自适应";
            break;
        default:
            break;
    }
    cell.textLabel.text = str;
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            FQImageAndTextController *vc = [[FQImageAndTextController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            FQWidthAndHeightController *vc = [[FQWidthAndHeightController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            FQCellAdaptiveController *vc = [[FQCellAdaptiveController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:
        {
            FQhandAdaptController *vc = [[FQhandAdaptController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }

}


@end
