//
//  FQhandAdaptController.m
//  FQadaptive
//
//  Created by 冯倩 on 2016/11/3.
//  Copyright © 2016年 冯倩. All rights reserved.
//

#import "FQhandAdaptController.h"
#import "textHandCell.h"

@interface FQhandAdaptController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView     *_mainTableView;
    NSArray         *_dataArray;          //显示文字数组
    NSMutableArray  *_heightMutableArray; //每行高度数组
}

@end

@implementation FQhandAdaptController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64) style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [self.view addSubview:_mainTableView];
    
    //文字数据数组
    _dataArray = @[@"今天天气不错",
                   @"今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错",
                   @"今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错",
                   @"今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错",
                   @"今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错今天天气不错",
                   @"今天天气不错",
                   @"今年2月，中央政治局决定，党的十八届六中全会专题研究全面从严治党问题，制定新形势下党内政治生活的若干准则，修订《中国共产党党内监督条例（试行）》，成立文件起草组，由我担任组长，刘云山、王岐山同志任副组长，有关部门和地方负责同志参加，在中央政治局常委会领导下进行工作,     在开展党的群众路线教育实践活动和“三严三实”专题教育中，不少同志建议结合新的形势，制定一个加强和规范党内政治生活的文件",
                   @"2014年1月12日，我在给刘云山、王岐山同志的批示中指出1980年制定的《关于党内政治生活的若干准则》，对于当时恢复和健全党内民主、维护党的集中统一、严肃党的纪律、促进党的团结，实现政治上、思想上、组织上、作风上的拨乱反正，实现全党工作中心的转移，发挥了重要历史作用。当前，《准则》对我们严肃和规范党内政治生活、弘扬党的优良传统和作风仍具有重要现实指导意义。30多年来，形势任务和党内情况发生了很大变化，党的建设既积累了大量新成果新经验，又面临许多新情况新问题。请你们考虑是否适当时机由中央就新形势下加强和规范党内政治生活作出一个决定，提出新的要求",
                   @"这些前期研究形成了一些重要成果，中央政治局综合分析，决定用一次中央全会专题研究这个问题。主要有以下几方面考虑。"
                   ];
    //每行高度数组
    _heightMutableArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _dataArray.count; i++)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName];
        CGSize size = [_dataArray[i] boundingRectWithSize:CGSizeMake(ScreenWidth - 8 * 2, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        CGFloat height = size.height + 8 * 2;
        [_heightMutableArray addObject:@(height)];
    }
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
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"textAdaptiveCell";
    textHandCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
        cell = [[textHandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    //cell内容
    cell.contentLabel.text = _dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_heightMutableArray[indexPath.row] floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}


@end
