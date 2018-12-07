//
//  CountdownButton.h
//  PSC
//
//  Created by wesley on 2018/3/13.
//  Copyright © 2018年 suningPSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownButton : UIButton
-(void)start;
@property (nonatomic, assign)NSInteger second;
@end
