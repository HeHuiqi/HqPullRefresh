//
//  HqShadowView.m
//  HqPullRefresh
//
//  Created by hqmac on 2018/11/26.
//  Copyright © 2018 solar. All rights reserved.
//

#import "HqShadowView.h"

@implementation HqShadowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width  = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(2.5, height-5, width-5, 5)];
    self.layer.shadowPath = path.CGPath;
    self.layer.shadowColor = [UIColor blueColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 1.0;//阴影透明度，默认0
    self.layer.shadowRadius = 5.0;//阴影半径，默认3
}

@end
