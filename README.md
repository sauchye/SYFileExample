# SYFileExample

A file  Handle data demo



### Usage

Drag SYFileManager file to your project, See Example :）

``` objective-c

- (BOOL)writeDictionaryWithfileName:(NSString *)fileName
                         dictionary:(NSDictionary *)dictionary;

- (BOOL)writeArrayWithfileName:(NSString *)fileName
                         array:(NSArray *)array;

- (NSArray *)readArrayFileName:(NSString *)fileName;

- (NSDictionary *)readDictionaryFileName:(NSString *)fileName;

- (void)removeObject:(NSArray *)array
            fileName:(NSString *)fileName;

- (void)removeAllObjectsWithFileName:(NSString *)fileName;
```



### License

``SYFileExample`` is under MIT License. See LICENSE file for more information.