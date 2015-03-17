//
//  LotusyAddress.m
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyAddress.h"

@interface LotusyAddress()

@property (nonatomic, strong) NSString* _street;
@property (nonatomic, strong) NSString* _city;
@property (nonatomic, strong) NSString* _state;
@property (nonatomic, strong) NSString* _country;
@property (nonatomic, strong) NSString* _zip;

@end


@implementation LotusyAddress

- (id) initWithAddress:(NSString*)street
                  city:(NSString*)city
                 state:(NSString*)state
               country:(NSString*)country
                   zip:(NSString*)zip {
    self._street = street;
    self._city = city;
    self._state = state;
    self._country = country;
    self._zip = zip;

    return self;
}

- (NSString*) street { return self._street; }
- (NSString*) city { return self._city; }
- (NSString*) state { return self._state; }
- (NSString*) country { return self._country; }
- (NSString*) zip { return self._zip; }

@end
