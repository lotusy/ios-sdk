//
//  LotusyAddress.h
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyAddress : NSObject

- (id) initWithAddress:(NSString*)street
                  city:(NSString*)city
                 state:(NSString*)state
               country:(NSString*)country
                   zip:(NSString*)zip;

- (NSString*) street;
- (NSString*) city;
- (NSString*) state;
- (NSString*) country;
- (NSString*) zip;

@end
