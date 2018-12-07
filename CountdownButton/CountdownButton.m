//
//  CountdownButton.m
//  PSC
//
//  Created by wesley on 2018/3/13.
//  Copyright © 2018年 suningPSC. All rights reserved.
//

#import "CountdownButton.h"
#import "UIColor-Expanded.h"
#import "Masonry.h"


@interface CountdownButton ()
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, strong)UILabel *lab;
@end
@implementation CountdownButton
{
    NSInteger cnt;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    return self;
}
-(void)start{
    CommonViewController *view = [CommonViewController new];
    self.userInteractionEnabled = NO;
    //    self.layer.borderColor = [UIColor colorWithHexString:@"CFCFCF"].CGColor;
    [self setTitleColor:HEX_COLOR(0xBBBBBB) forState:UIControlStateNormal];
    cnt = _second;
    [self setTitle:[NSString stringWithFormat:@"%lus",cnt] forState:UIControlStateNormal];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    _lab = [UILabel new];
    [self addSubview:_lab];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_right).offset(@15);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
-(void)countDown{
    cnt --;
    [self setTitle:[NSString stringWithFormat:@"%lds",cnt] forState:UIControlStateNormal];
    if (cnt == 0) {
        //        self.layer.borderColor = [UIColor colorWithHexString:@"73AEF3"].CGColor;
        [self setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
        [self setTitle:@"重新发送" forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
        [_timer invalidate];
        _timer = nil;
    }
}
-(void)dealloc{
    [_timer invalidate];
    _timer = nil;
}
@end

