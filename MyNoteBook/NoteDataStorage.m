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

//获得沙盒目录
- (NSString *)getSandBoxPath {
    NSString *sandBoxPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE) firstObject];
    //数据库路径
    NSString *noteStoragePath = [sandBoxPath stringByAppendingPathComponent:@"notes.db"];
    return noteStoragePath;
}

//生成数据库


//创造单例懒加载
+ (NoteDataStorage *)getInstance{
    if(singleInstance == nil){
        
        singleInstance = [[NoteDataStorage alloc]init];
        singleInstance.fmdbStorage = [FMDatabase databaseWithPath:[singleInstance getSandBoxPath]];
        //如果数据库创建成功
        if([singleInstance.fmdbStorage open]) {
            [singleInstance addNotesTable];
        }else {
            NSLog(@"数据库创建失败！");
        }
    }
    return singleInstance;
}

//内存列表懒加载
- (NSMutableArray *)noteCollection {
    if(_noteCollection == nil) {
        NSMutableArray *emptyArray = [NSMutableArray array];
        _noteCollection = emptyArray;
    }
    return _noteCollection;
}

//创建表格
- (void)addNotesTable {
    NSString *noteTableCreateSQL = @"create table if not exists notes (date text, title text, content text)";
    BOOL createSuccess = [singleInstance.fmdbStorage executeUpdate:noteTableCreateSQL];
    if(!createSuccess) {
        NSLog(@"数据库表格创建失败!");
    }
}

//获取表格所有内容
- (void)getAllNotesToCollection {
    [_fmdbStorage open];
    self.noteCollection = [NSMutableArray array];
    //取出数据库中指定表格的所有行
    NSString *getNoteSQL = [NSString stringWithFormat:@"select * from notes"];
    FMResultSet *notesSaved = [_fmdbStorage executeQuery:getNoteSQL];
    NSLog(@"Find result : %d",notesSaved.columnCount);
    //循环，遍历每一行的每一列
    while([notesSaved next]) {
        NoteLog *newNote = [[NoteLog alloc]init];
        newNote.noteDate = [notesSaved stringForColumn:@"date"];
        newNote.noteText = [notesSaved stringForColumn:@"content"];
        newNote.noteTitle = [notesSaved stringForColumn:@"title"];
        [self.noteCollection addObject:newNote];
        NSLog(@"Recieve %ld notes from dataBase",self.noteCollection.count);
    }
    [singleInstance.fmdbStorage close];
}

//增加一行数据
- (void)insertNoteToNoteTable:(NoteLog *)newNote {
    [self.fmdbStorage open];
    NSString *addSQL = [NSString stringWithFormat:@"insert into notes(date,content,title) values(?,?,?)"];
    NSError *error = nil;
    BOOL isUpdateSuccess = [self.fmdbStorage executeUpdate:addSQL values:@[newNote.noteDate,newNote.noteText,newNote.noteTitle] error:&error];
    if(!isUpdateSuccess) {
        NSLog(@"插入信息失败！%@",self.fmdbStorage.lastErrorMessage);
    }
    [self.fmdbStorage close];
}

//删除一行数据
- (void)deleteNoteFromNoteTable:(NoteLog *)targetNote {
    [_fmdbStorage open];
    NSString *deleteSQL = [NSString stringWithFormat:@"delete from notes where title = ?"];
    BOOL isUpdateSuccess = [_fmdbStorage executeUpdate:deleteSQL values:@[targetNote.noteTitle] error:nil];
    if(!isUpdateSuccess) {
        NSLog(@"删除信息失败！%@",_fmdbStorage.lastErrorMessage);
    }
    [_fmdbStorage close];
}

//修改一行数据
- (void)modifyNoteFromNoteTable:(NoteLog *)targetNote {
    [_fmdbStorage open];
    NSString *modifySQL1 = [NSString stringWithFormat:@"update notes set content = %@ where date = %@",targetNote.noteText,targetNote.noteDate];
    NSString *modifySQL2 = [NSString stringWithFormat:@"update notes set title = %@ where date = %@",targetNote.noteTitle,targetNote.noteDate];
    BOOL isUpdateSuccess = [_fmdbStorage executeUpdate:modifySQL1] && [_fmdbStorage executeUpdate:modifySQL2];
    if(!isUpdateSuccess) {
        NSLog(@"修改信息失败！%@",_fmdbStorage.lastErrorMessage);
    }
    [_fmdbStorage close];
}

//清空全部数据
- (void)removeAllNotesFromNoteTable {
    [_fmdbStorage open];
    NSString *removeSQL = [NSString stringWithFormat:@"delete from student"];
    BOOL isUpdateSuccess = [_fmdbStorage executeUpdate:removeSQL];
    if(!isUpdateSuccess) {
        NSLog(@"清空表格失败!%@",_fmdbStorage.lastErrorMessage);
    }
    [_fmdbStorage close];
}

//for data source;
+ (NSMutableArray *)addingNote:(NoteLog *)note{
    NoteDataStorage *storage = [self getInstance];
    [storage insertNote:note];
    [storage insertNoteToNoteTable:note];
    return [storage getNoteList];
}

+ (NSMutableArray *)deletingNote:(NoteLog *)note{
    NoteDataStorage *storage = [self getInstance];
    [storage removeNote:note];
    [storage deleteNoteFromNoteTable:note];
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
    if(self.noteCollection.count == 0) {
        [self getAllNotesToCollection];
    }
    return self.noteCollection;
}

@end
