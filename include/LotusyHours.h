//
//  LotusyHours.h
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyHours : NSObject

- (id) initWithParam:(NSString*)mon
                 tue:(NSString*)tue
                 wed:(NSString*)wed
                 thu:(NSString*)thu
                 fri:(NSString*)fri
                 sat:(NSString*)sat
                 sun:(NSString*)sun
             holiday:(NSString*)holiday;

- (NSString*) mon;
- (NSString*) tue;
- (NSString*) wed;
- (NSString*) thu;
- (NSString*) fri;
- (NSString*) sat;
- (NSString*) sun;
- (NSString*) holiday;

@end
