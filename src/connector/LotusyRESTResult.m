//
//  LotusyRESTResult.m
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyRESTResult.h"

@interface LotusyRESTResult()

@property (nonatomic) BOOL _success;
@property (nonatomic) int _statusCode;
@property (nonatomic, strong) NSMutableArray* _errors;

@end


@implementation LotusyRESTResult

- (id) initWithParam:(BOOL)success
          statusCode:(int)statusCode {
    self._success = success;
    self._statusCode = statusCode;
    self._errors = [[NSMutableArray alloc]init];

    return self;
}
- (void) addError:(NSString*)error {
    [self._errors addObject:error];
}
- (BOOL) success {
    return self._success;
}
- (int) statusCode {
    return self._statusCode;
}
- (NSArray*) errors {
    return self._errors;
}

+ (LotusyRESTResult*) unauthResult {
    LotusyRESTResult* result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:401];
    [result addError:@"not_authorized"];

    return result;
}
@end
