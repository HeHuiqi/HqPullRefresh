//
//  HqBarButtonItem.h
//  HqPullRefresh
//
//  Created by hqmac on 2018/12/3.
//  Copyright © 2018 solar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HqBarButtonItem : UIBarButtonItem
@property (nonatomic,copy) NSString *normalTitle;
@property (nonatomic,copy) NSString *selectedTitle;
@property (nonatomic,assign) BOOL selected;

- (instancetype)initWithNormalTitle:(NSString *)normalTitle seletedTitle:(NSString *)selectedTitle;
- (void)addTarget:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
