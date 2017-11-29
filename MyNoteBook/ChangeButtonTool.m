//
//  ChangeButtonTool.m
//  MyNoteBook
//
//  Created by Ivan_deng on 2017/11/27.
//  Copyright © 2017年 Ivan_deng. All rights reserved.
//

#import "ChangeButtonTool.h"

@implementation ChangeButtonTool

+ (void)changeButtonTitleWithText:(ToolBlock)block {
    if(block) {
        block(@"键盘风筝");
    }
}

@end
