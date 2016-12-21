//
//  NoteDataStorage.m
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/16.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import "NoteDataStorage.h"

@implementation NoteDataStorage

static NoteDataStorage * singleInstance;

//创造单例
+ (NoteDataStorage *)getInstance{
    if(singleInstance == nil){
        
        singleInstance = [[NoteDataStorage alloc]init];
        singleInstance.noteCollection = [NSMutableArray array];
        NoteLog *note = [[NoteLog alloc]initWithContent:@"测试单元格内容"];
        [singleInstance insertNote:note];
    }
    return singleInstance;
}
//for data source;
+ (NSMutableArray *)addingNote:(NoteLog *)note{
    NoteDataStorage *storage = [self getInstance];
    [storage insertNote:note];
    return [storage getNoteList];
}

+ (NSMutableArray *)deletingNote:(NoteLog *)note{
    NoteDataStorage *storage = [self getInstance];
    [storage removeNote:note];
    return [storage getNoteList];
}

+ (NSMutableArray *)allNote:(NoteLog *)note{
    NoteDataStorage *storage = [self getInstance];
    return [storage getNoteList];
}

//插入note方法
- (int)insertNote:(NoteLog *)noteLog{
    [self.noteCollection addObject:noteLog];
    return 0;
}

//删除note方法
- (int)removeNote:(NoteLog *)noteLog{
    for(NoteLog *note in _noteCollection){
        if([note.noteDate isEqualToString:noteLog.noteDate]){
            [self.noteCollection removeObject:note];
            break;
        }
    }
    return 0;
}

//修改note方法
-(int)modifyNote:(NoteLog *)noteLog{
    for(NoteLog *note in _noteCollection){
        if([note.noteDate isEqualToString:noteLog.noteDate]){
            note.noteText = noteLog.noteText;
            note.noteTitle = noteLog.noteTitle;
            break;
        }
    }
    return 0;
}

//查找指定note
- (NoteLog *)getSepiceficNote:(NoteLog *)noteLog{
    for(NoteLog *note in _noteCollection){
        if([note.noteDate isEqualToString:noteLog.noteDate]){
            return note;
        }
    }
    return [[NoteLog alloc]init];
}

//获取所有note
- (NSMutableArray *)getNoteList{
    if(self.noteCollection){
        return self.noteCollection;
    }
    else
        return self.noteCollection = [NSMutableArray arrayWithObjects:[[NoteLog alloc]init], nil];
}

@end
