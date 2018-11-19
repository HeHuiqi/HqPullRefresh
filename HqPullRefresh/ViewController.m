//
//  ViewController.m
//  HqPullRefresh
//
//  Created by hqmac on 2018/11/19.
//  Copyright © 2018 solar. All rights reserved.
//

#import "ViewController.h"
#import "HqRefreshHeader.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) HqRefreshHeader *rh;
@property (nonatomic,strong) NSMutableArray *titles;

@end

@implementation ViewController


- (HqRefreshHeader *)rh{
    if (!_rh) {
        _rh = [[HqRefreshHeader alloc] initWithFrame:CGRectMake(0, -60, self.view.bounds.size.width, 60)];
    }
    return _rh;
}
- (UITableView *)tableView{
    if (!_tableView) {
        CGRect rect = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64);
        rect = self.view.bounds;
        _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HQPullRefresh";
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.titles = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    [self.view addSubview:self.tableView];
    UILabel *header =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    header.text = @"这是表头";
    header.textAlignment = NSTextAlignmentCenter;
    header.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = header;
    
    self.rh.scrollView = self.tableView;
    __weak typeof(self) weakSelf = self;
    self.rh.beginRefreshBlock = ^{
        //模拟请求
       // NSLog(@"请求网络数据。。。");
        for (int i = 0; i<3; i++) {
            NSString *number = [NSString stringWithFormat:@"%d",arc4random_uniform(256)];
            [weakSelf.titles addObject:number];
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           // NSLog(@"请求完成了，刷新界面");
            [weakSelf.rh endRefreshing];
            [weakSelf.tableView reloadData];
        });
    };
    
}


@end
