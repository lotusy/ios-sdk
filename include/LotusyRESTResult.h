//
//  LotusyConnectorResult.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyRESTResult : NSObject

- (id) initWithParam:(BOOL)success
          statusCode:(int)statusCode;

- (void) addError:(NSString*)error;

- (BOOL) success;

- (int) statusCode;

- (NSArray*) errors;

+ (LotusyRESTResult*) unauthResult;

@end
