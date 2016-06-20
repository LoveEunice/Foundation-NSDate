//
//  main.m
//  Foundation-NSDate
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYstudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 日期类 NSDate
        NSDate *date1=[NSDate date];//默认的是格林尼治时间(GMT)
        NSLog(@"date1==%@",date1);
        //从某个日期过了多少秒
        NSDate *date2=[NSDate dateWithTimeInterval:13*3600 sinceDate:date1];
        NSLog(@"date2=%@",date2);
        //从现在开始过了多少秒的时间
        NSLog(@"%@",[NSDate dateWithTimeIntervalSinceNow:120]);
        //ReferenceDate  2001-1-1 00:00:00
        NSLog(@"%@",[NSDate dateWithTimeIntervalSinceReferenceDate:120]);
        //从1970的凌晨过了多长时间
        NSLog(@"%@",[NSDate dateWithTimeIntervalSince1970:1200]);
        date1=[date1 dateByAddingTimeInterval:1200];
        NSLog(@"date1==%@",date1);
        
        //计算时间差
        NSTimeInterval var1=[date2 timeIntervalSince1970];
        NSLog(@"%g",var1);
        NSLog(@"%g",[date2 timeIntervalSinceDate:date1]);
        NSLog(@"%g",[date2 timeIntervalSinceNow]);
        
        //获取较早较晚时间
        NSLog(@"%@",[date1 earlierDate:date2]);
        NSLog(@"%@",[date2 laterDate:date1]);
        
        //比较
        if ([date2 isEqualToDate:date1])
        {
            NSLog(@"equal");
        }
        else
        {
            NSLog(@"not equal");
        }
        NSComparisonResult result=[date1 compare:date2];//比较结果为枚举
        NSLog(@"result==%ld",result);
        switch (result)
        {
            case NSOrderedAscending://升序
                NSLog(@"date1 < date");
                break;
            case NSOrderedSame:
                NSLog(@"equal");
                break;
            case NSOrderedDescending:
                NSLog(@"date1 > date2");
                
            default:
                break;
        }
        //日期格式
        NSDateFormatter *formater=[NSDateFormatter new];
        //设置格式
        [formater setDateFormat:@"yyyy年-MM月-dd日"];
        [formater setDateStyle:(NSDateFormatterFullStyle)];
        [formater setTimeStyle:NSDateFormatterFullStyle];
        NSString *dateStr=[formater stringFromDate:date1];
        NSLog(@"%@",dateStr);
        //未来和过去的时间
        NSLog(@"未来>>>>%@",[NSDate distantFuture]);
        NSLog(@"过去>>>>%@",[NSDate distantPast]);
        
        //获取所有的市时区
        NSArray *allTimezone=[NSTimeZone knownTimeZoneNames];
       // NSLog(@"allTimezone==%@,%ld",allTimezone,allTimezone.count);
        //获得当前时区
        NSLog(@"当前时区:%@",[NSTimeZone localTimeZone]);
        //指定时区
        NSLog(@"指定时区%@",[NSTimeZone timeZoneWithName:@"Asia/Magadan"]);
        [formater setDateFormat:@"'公元前/后:'G  '年份:'u'='yyyy'='yy '季度:'q'='qqq'='qqqq '份:'M'='MMM'='MMMM '今天是今年第几周:'w '今天是本月第几周:'W  '今天是今天第几天:'D '今天是本月第几天:'d '星期:'c'='ccc'='cccc '上午/下午:'a'小时:'h'='H '分钟:'m '秒:'s '毫秒:'SSS  '这一天已过多少毫秒:'A  '时区名称:'zzzz'='vvvv '时区编号:'Z "];
         
         NSLog(@"%@", [formater stringFromDate:[NSDate date]]);
        //获得现在的具体时间
        //1.创建日期
        NSDate *now=[NSDate date];//GMT
        //2.获取当前时区
        NSTimeZone *zone=[NSTimeZone systemTimeZone];//[NSTimeZone localTimeZone];
        //3.获取时间差
        NSTimeInterval var2=[zone secondsFromGMT];
        //4.拼接间隔
        NSLog(@"now is %@",[now dateByAddingTimeInterval:var2]);
        //一句代码搞定
        NSLog(@"%@",[[NSDate date] dateByAddingTimeInterval:[[NSTimeZone localTimeZone] secondsFromGMT]]);
        
        //日历
        NSCalendar *cal=[NSCalendar currentCalendar];
        NSDateComponents *comments=[NSDateComponents new];
        [comments setYear:2001];
        [comments setMonth:01];
        [comments setDay:01];
        [comments setHour:00];
        [comments setMinute:00];
        [comments setSecond:00];
        NSDate *myDate=[cal dateFromComponents:comments];
        NSLog(@"cal==%@",myDate);
        
        NSLog(@"NSTimer...");
        //NSTimer定时器
        QYstudent *s1=[QYstudent new];
        [s1 study];
        //无法保存当前进程，所以看不到效果，需要加入循环
//        [[NSRunLoop mainRunLoop] run];
        [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
    }
    return 0;
}
