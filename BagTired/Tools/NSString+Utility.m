//
//  NSString+Utility.m
//  BagTired
//
//  Created by guoshencheng on 10/25/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
