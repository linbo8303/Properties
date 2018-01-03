//
//  NSDictionary+KeyPathConvenience.m
//  Properties
//
//  Created by Bo Lin on 3/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

#include "NSDictionary+KeyPathConvenience.h"

@implementation NSDictionary (KeyPathConvenience)

- (NSNumber *)numberForKeyPath:(NSString *)keyPath {
    return (NSNumber *)[self valueForKeyPath:keyPath];
}

- (NSString *)stringForKeyPath:(NSString *)keyPath {
    return (NSString *)[self valueForKeyPath:keyPath];
}

- (BOOL)boolForKeyPath:(NSString *)keyPath {
    return [((NSNumber *)[self valueForKeyPath:keyPath]) boolValue];

}

- (NSURL *)urlForKeyPath:(NSString *)keyPath {
    NSString *urlString = [self stringForKeyPath:keyPath];
    if (urlString.length > 0) {
        return [NSURL URLWithString:urlString];
    }
    return nil;
}

- (NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath {
    return (NSDictionary *)[self valueForKeyPath:keyPath];

}

- (NSArray *)arrayForKeyPath:(NSString *)keyPath {
    return (NSArray *)[self valueForKeyPath:keyPath];
}

@end
