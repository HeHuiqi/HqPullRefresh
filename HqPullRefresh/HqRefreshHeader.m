//
//  HqRefreshHeader.m
//  HqPullRefresh
//
//  Created by hqmac on 2018/11/19.
//  Copyright © 2018 solar. All rights reserved.
//

#import "HqRefreshHeader.h"
#define HqObserveKeyPath @"contentOffset"
@interface HqRefreshHeader()<UIScrollViewDelegate>
@property (nonatomic,assign) CGFloat initOffsetY;

@end
@implementation HqRefreshHeader
- (void)dealloc{
    if (_scrollView) {
        [_scrollView removeObserver:self forKeyPath:HqObserveKeyPath];
    }
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)setScrollView:(UIScrollView *)scrollView{
    _scrollView = scrollView;
    if (_scrollView) {
        self.frame = CGRectMake(0, -HqRefrshPullY, _scrollView.bounds.size.width, HqRefrshPullY);
        [_scrollView addSubview:self];
         [_scrollView addObserver:self forKeyPath:HqObserveKeyPath options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    }
}
- (void)setup{
    self.initOffsetY = 0;
    self.refreshColor = [UIColor colorWithRed:63.0/255.0 green:124.0/255.0 blue:221.0/255.0 alpha:1.0];
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.layer addSublayer:self.pathLayer];
    [self addSubview:self.indictatorView];
}
- (void)beginRefreshing{
    self.isRefreshing = YES;
    [self.indictatorView startAnimating];
    if (self.beginRefreshBlock) {
        self.beginRefreshBlock();
    }
}
- (void)beginRefreshingWithBlock:(HqBeginRefreshBlock)block{
    self.beginRefreshBlock = block;
}
- (void)setRefreshColor:(UIColor *)refreshColor{
    _refreshColor = refreshColor;
}
- (void)endRefreshing{
    [self.indictatorView stopAnimating];
    NSLog(@"self.initOffsetY == %@",@(self.initOffsetY));
    [UIView animateWithDuration:0.3 animations:^{
        if (self.initOffsetY != 0) {
            [self.scrollView setContentOffset:CGPointMake(0, self.initOffsetY)  animated:NO];

        }else{
            [self.scrollView setContentOffset:CGPointMake(0, 0)  animated:NO];

        }
        self.pullScale = 0;
    } completion:^(BOOL finished) {

        NSLog(@"动画结束====");
        self.isRefreshing = NO;
    }];
}
- (void)setIsRefreshing:(BOOL)isRefreshing{
    _isRefreshing = isRefreshing;
    self.pathLayer.hidden = _isRefreshing;
}
- (UIActivityIndicatorView *)indictatorView{
    if (!_indictatorView) {
        _indictatorView = [[UIActivityIndicatorView alloc] init];
        _indictatorView.color = self.refreshColor;
        CGFloat Y = HqRefrshPullY/2.0;
        CGFloat X = [UIScreen mainScreen].bounds.size.width/2.0;
        CGPoint center = CGPointMake(X, Y);
        _indictatorView.center = center;
    }
    return _indictatorView;
}
- (CAShapeLayer *)pathLayer{
    if (!_pathLayer) {
        _pathLayer = [CAShapeLayer layer];
        _pathLayer.fillColor = [UIColor clearColor].CGColor;
        _pathLayer.strokeColor = self.refreshColor.CGColor;
        _pathLayer.strokeStart = 0;
        _pathLayer.lineWidth = 2;
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGFloat Y = HqRefrshPullY/2.0;
        CGFloat radius = Y-15;
        CGFloat X = [UIScreen mainScreen].bounds.size.width/2.0;
        CGPoint center = CGPointMake(X, Y);
        [path addArcWithCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:YES];
        _pathLayer.path = path.CGPath;
        _pathLayer.strokeEnd = 0;
    }
    return _pathLayer;
}
- (void)setPullScale:(CGFloat)pullScale{
    _pullScale = pullScale;
    _pathLayer.strokeEnd = _pullScale;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:HqObserveKeyPath]) {
        CGFloat offsetY = self.scrollView.contentOffset.y;
        //NSLog(@"offsetY= %@",@(offsetY));
        if (self.initOffsetY==0) {
            self.initOffsetY = offsetY;
            NSLog(@"self.initOffsetY-init == %@",@(self.initOffsetY));

        }

        if (offsetY<self.initOffsetY) {
            if (self.isRefreshing) {
                return;
            }
            CGFloat pullScale = fabs(offsetY-self.initOffsetY)/HqRefrshPullY;
            self.pullScale =pullScale;
            //NSLog(@"pullScale= %@",@(pullScale));
            if (pullScale >= 1.0) {
                if (!self.scrollView.dragging) {
                    [self.scrollView setContentOffset:CGPointMake(0, -HqRefrshPullY+self.initOffsetY) animated:YES];
                    [self beginRefreshing];
                }else{
                    
                }
            }else{
                
            }
        }else{

        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
