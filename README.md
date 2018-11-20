# HqPullRefresh
简单快捷的下拉刷新、上拉加载组件,快速集成
## 使用方式
```
- (HqRefreshHeader *)rh{
    if (!_rh) {
        _rh = [[HqRefreshHeader alloc] init];
    }
    return _rh;
}
//tableView自行创建
/*
    CGRect rect = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64);
    rect = self.view.bounds;
    _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    注意：如果设置tableView的位置不是self.view.bounds,请设置UIViewController的一下属性
    self.automaticallyAdjustsScrollViewInsets = NO;
*/
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

```
### 详情使用参考代码
