//
//  LotusyHours.m
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyHours.h"

@interface LotusyHours()

@property (nonatomic, strong) NSString* _mon;
@property (nonatomic, strong) NSString* _tue;
@property (nonatomic, strong) NSString* _wed;
@property (nonatomic, strong) NSString* _thu;
@property (nonatomic, strong) NSString* _fri;
@property (nonatomic, strong) NSString* _sat;
@property (nonatomic, strong) NSString* _sun;
@property (nonatomic, strong) NSString* _holiday;

@end

@implementation LotusyHours

- (id) initWithParam:(NSString*)mon
                 tue:(NSString*)tue
                 wed:(NSString*)wed
                 thu:(NSString*)thu
                 fri:(NSString*)fri
                 sat:(NSString*)sat
                 sun:(NSString*)sun
             holiday:(NSString*)holiday {
    self._mon = mon;
    self._tue = tue;
    self._wed = wed;
    self._thu = thu;
    self._fri = fri;
    self._sat = sat;
    self._sun = sun;
    self._holiday = holiday;

    return self;
}

- (NSString*) mon { return self._mon; }
- (NSString*) tue { return self._tue; }
- (NSString*) wed { return self._wed; }
- (NSString*) thu { return self._thu; }
- (NSString*) fri { return self._fri; }
- (NSString*) sat { return self._sat; }
- (NSString*) sun { return self._sun; }
- (NSString*) holiday { return self._holiday; }
@end
