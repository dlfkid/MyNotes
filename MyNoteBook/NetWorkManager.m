//
//  NetWorkManager.m
//  MyNoteBook
//
//  Created by Ivan_deng on 2017/11/27.
//  Copyright © 2017年 Ivan_deng. All rights reserved.
//

#import "NetWorkManager.h"
#import <AFNetworking/AFNetworking.h>

#define HOSTNAME @"http://httpbin.org"


@implementation NetWorkManager

+ (void)updateCurrentNoteCollectionToServer:(NSArray *)noteCollection {
    
}

+ (NSArray *)downLoadAllNotesFromServer {
    //创建空note数组
    NSMutableArray *serverNotes = [NSMutableArray array];
    
    //开始网络请求
    
    
    //返回数组对象
    return [NSArray arrayWithArray:serverNotes];
}

+ (void)emptyNoteCollectionOnServer {
    
}

+ (void)requestBegin {
    NSString *requestUrlString = [HOSTNAME stringByAppendingString:@"/get"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:requestUrlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(task.error) {
            NSLog(@"Error occur: %@",task.error.localizedDescription);
        }else {
            NSDictionary *responseDict = responseObject;
            NSLog(@"get respons: %@",responseDict);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求失败，请求没有发送!");
    }];
}

+ (void)postRequestBegin {
    NSString *requsetUrlString = [HOSTNAME stringByAppendingString:@"/anything"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:requsetUrlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(task.error) {
            NSLog(@"Error occur: %@",task.error.localizedDescription);
        }else {
            NSDictionary *responseDict = responseObject;
            NSLog(@"get respons: %@",responseDict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求失败，请求没有发送!");
    }];
}

@end
