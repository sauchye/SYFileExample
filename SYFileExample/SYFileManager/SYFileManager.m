//
//  SYFileManager.m
//  SYFileExample
//
//  Created by Saucheong Ye on 6/30/15.
//  Copyright © 2015 Saucheong Ye. All rights reserved.
//

#import "SYFileManager.h"

@interface SYFileManager ()
{
    NSFileManager  *_fileManager;
    NSFileHandle   *_handle;
    NSString *_filePath;
}
@end

@implementation SYFileManager

+ (instancetype)sharedInstance{
    
    static SYFileManager *manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[SYFileManager alloc] init];
    });
    
    return manager;
}


- (NSString *)getDocumentsWithFileName:(NSString *)fileName{
    
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [filePath firstObject];
    NSError *error = nil;
    _fileManager = [NSFileManager defaultManager];
    NSString *dataPath = [documents stringByAppendingPathComponent:@"Data"];
    BOOL res = [_fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (res) {
        NSLog(@"create data file success");
    }else{
        NSLog(@"create data file fail");
    }
    NSString *name = [NSString stringWithFormat:@"%@.plist",fileName];
    
    NSString *dataFilePath = [dataPath stringByAppendingPathComponent:name];
    
    return dataFilePath;
}

- (BOOL)writeArrayWithfileName:(NSString *)fileName
                         array:(NSArray *)array{
    
    _filePath = [self getDocumentsWithFileName:fileName];
    NSLog(@"path\n%@",_filePath);

    NSError *error = nil;
    if ([_fileManager fileExistsAtPath:_filePath]) {
        
        [_fileManager removeItemAtPath:_filePath error:&error];
        
        NSLog(@"writeArrayWithfileName\n%@",error);
    }
    
    return [array writeToFile:_filePath atomically:YES];
}

- (BOOL)writeDictionaryWithfileName:(NSString *)fileName
                         dictionary:(NSDictionary *)dictionary{
    
    _filePath = [self getDocumentsWithFileName:fileName];
    NSLog(@"path\n%@",_filePath);

    NSError *error = nil;
    if ([_fileManager fileExistsAtPath:_filePath]) {
        
        [_fileManager removeItemAtPath:_filePath error:&error];
        
        NSLog(@"writeDictionaryWithfileName\n%@",error);
    }
    
    return [dictionary writeToFile:_filePath atomically:YES];
}

- (NSArray *)readArrayFileName:(NSString *)fileName{
    
    _filePath = [self getDocumentsWithFileName:fileName];
    return [NSArray arrayWithContentsOfFile:_filePath];
}

- (NSDictionary *)readDictionaryFileName:(NSString *)fileName{
    
    _filePath = [self getDocumentsWithFileName:fileName];
    return [NSDictionary dictionaryWithContentsOfFile:_filePath];
}

- (void)removeMutableArray:(NSMutableArray *)mutableArray
                   atIndex:(NSUInteger)index
                  fileName:(NSString *)fileName{
    
    [mutableArray removeObjectAtIndex:index];
    _filePath = [self getDocumentsWithFileName:fileName];
    NSError *error = nil;
    
    if ([_fileManager fileExistsAtPath:_filePath]) {
        
        [_fileManager removeItemAtPath:_filePath error:&error];
        
        NSLog(@"removeAllObjectsWithFileName\n%@",error);
    }
    
    if (mutableArray) {
        
        [self writeArrayWithfileName:fileName array:mutableArray];
        
    }else{
        [self removeAllObjectsWithFileName:fileName];
    }

}

- (void)removeAllObjectsWithFileName:(NSString *)fileName{
    
    _filePath = [self getDocumentsWithFileName:fileName];
    _fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    if ([_fileManager fileExistsAtPath:_filePath]) {
        
        [_fileManager removeItemAtPath:_filePath error:&error];
        
        NSLog(@"removeAllObjectsWithFileName\n%@",error);
    }
}

@end
