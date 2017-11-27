//
//  AddViewController.h
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/15.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteLog.h"

typedef void(^callNoteLog)(NoteLog *noteLog);

@interface AddViewController : UIViewController

{
    callNoteLog packedNoteLog;
}

- (void)passNoteLog:(callNoteLog)noteLog;

@end
