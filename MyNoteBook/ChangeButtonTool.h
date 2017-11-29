//
//  ChangeButtonTool.h
//  MyNoteBook
//
//  Created by Ivan_deng on 2017/11/27.
//  Copyright © 2017年 Ivan_deng. All rights reserved.
//



#import <Foundation/Foundation.h>

typedef void(^ToolBlock)(NSString *title);

@interface ChangeButtonTool : NSObject

+ (void) changeButtonTitleWithText:(ToolBlock)block;

@end
