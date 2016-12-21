//
//  NoteLog.m
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/17.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import "NoteLog.h"

@implementation NoteLog

- (instancetype)initWithContent:(NSString *)content{
    if(self = [super init]){
        NSDate *date = [[NSDate alloc]init];
        NSDateFormatter *formatter =  [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        _noteDate = [formatter stringFromDate:date];
        _noteText = [NSString stringWithString:content];
        NSLog(@"%@",_noteText);
        if([content length]<=4){
            _noteTitle = content;
        }else{
            _noteTitle = [content substringToIndex:4];
        }
    }
    return self;
}

- (instancetype)initWithDate:(NSDate *)date andContent:(NSString *)content{
    if(self = [super init]){
        NSDateFormatter *formatter =  [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        _noteDate = [formatter stringFromDate:date];
        _noteText = [NSString stringWithString:content];
        NSLog(@"%@",_noteText);
        if([content length]<=4){
            _noteTitle = content;
        }else{
            _noteTitle = [content substringToIndex:4];
        }
    }
    return self;
}

- (instancetype)init{
    if(self = [super init]){
        _noteDate = @"XXXX-XX-XX xx:xx:xx";
        _noteTitle = @"No Title";
        _noteText = @"It's empty";
    }
    return self;
}

@end
