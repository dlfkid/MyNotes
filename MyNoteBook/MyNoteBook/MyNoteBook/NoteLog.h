//
//  NoteLog.h
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/17.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteLog : NSObject

@property(nonatomic,strong)    NSString * noteText;
@property(nonatomic,strong)    NSString * noteDate;
@property(nonatomic,strong)    NSString * noteTitle;

- (instancetype)initWithDate:(NSDate *)date andContent:(NSString *)content;

- (instancetype)initWithContent:(NSString *)content;

- (instancetype)init;

@end
