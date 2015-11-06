//
//  SYFileManager.h
//  SYFileExample
//
//  Created by Saucheong Ye on 6/30/15.
//  Copyright © 2015 Saucheong Ye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYFileManager : NSObject

+ (instancetype)sharedInstance;

- (BOOL)writeDictionaryWithfileName:(NSString *)fileName
                         dictionary:(NSDictionary *)dictionary;

- (BOOL)writeArrayWithfileName:(NSString *)fileName
                         array:(NSArray *)array;

- (NSArray *)readArrayFileName:(NSString *)fileName;

- (NSDictionary *)readDictionaryFileName:(NSString *)fileName;

- (void)removeObject:(NSArray *)array
            fileName:(NSString *)fileName;

- (void)removeAllObjectsWithFileName:(NSString *)fileName;

@end
