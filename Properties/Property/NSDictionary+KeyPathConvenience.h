//
//  NSDictionary+KeyPathConvenience.h
//  Properties
//
//  Created by Bo Lin on 3/1/18.
//  Copyright © 2018 Bo Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (KeyPathConvenience)

- (NSNumber *)numberForKeyPath:(NSString *)keyPath;

- (NSString *)stringForKeyPath:(NSString *)keyPath;

- (BOOL)boolForKeyPath:(NSString *)keyPath;

- (NSURL *)urlForKeyPath:(NSString *)keyPath;

- (NSDictionary *)dictionaryForKeyPath:(NSString *)keyPath;

- (NSArray *)arrayForKeyPath:(NSString *)keyPath;

@end
