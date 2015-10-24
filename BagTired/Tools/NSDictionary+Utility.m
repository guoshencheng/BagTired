//
//  NSDictionary+Utility.m
//  BagTired
//
//  Created by guoshencheng on 10/25/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "NSDictionary+Utility.h"

@implementation NSDictionary (Utility)

- (NSString *)assembleParameters {
    NSMutableArray *parts = [NSMutableArray array];
    for (NSString *key in [self allKeys]) {
        NSString *part = [NSString stringWithFormat:@"%@=%@", key, [self valueForKey:key]];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}

- (NSString *)toJsonString {
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
