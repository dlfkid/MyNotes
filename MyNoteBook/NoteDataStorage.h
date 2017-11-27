//
//  NoteDataStorage.h
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/16.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDatabase.h>
#import "NoteLog.h"


@interface NoteDataStorage : NSObject

@property(nonatomic,strong) NSMutableArray *noteCollection;
@property(nonatomic,strong) FMDatabase *fmdbStorage;

+ (NoteDataStorage *)getInstance;

- (int)insertNote:(NoteLog *)noteLog;

- (int)removeNote:(NoteLog *)noteLog;

- (int)modifyNote:(NoteLog *)noteLog;

+ (NSMutableArray *)addingNote:(NoteLog *)note;

+ (NSMutableArray *)deletingNote:(NoteLog *)note;

+ (NSMutableArray *)allNote:(NoteLog *)note;

- (NoteLog *)getSepiceficNote:(NoteLog *)noteLog;

- (NSMutableArray *)getNoteList;

@end
