//
//  NetWorkManager.h
//  MyNoteBook
//
//  Created by Ivan_deng on 2017/11/27.
//  Copyright © 2017年 Ivan_deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetWorkManager : NSObject

+ (void)updateCurrentNoteCollectionToServer:(NSArray *)noteCollection;

+ (NSArray *)downLoadAllNotesFromServer;

+ (void)emptyNoteCollectionOnServer;

+ (void)requestBegin;

+ (void)postRequestBegin;

@end
