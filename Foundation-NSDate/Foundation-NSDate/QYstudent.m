//
//  QYstudent.m
//  Foundation-NSDate
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYstudent.h"

@implementation QYstudent
-(void)study
{
    //启动定时器
    //第一个参数：多长时间启动一次定时器
    //第二个参数：表示在什么地方去执行具体操作
    //第三个参数：定时器启动后具体执行的方法
    //第四个参数：用户信息，一般为nil
    //第五个参数：是否重复执行
    _timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(doSomeThing) userInfo:nil repeats:YES];
}
-(void)doSomeThing
{
    static int count=0;
    count++;
    NSLog(@"study...");
//    if (count>=4)
//    {
//        //计时器停止
//        [_timer invalidate];//计时器失效
//    }
}
@end
