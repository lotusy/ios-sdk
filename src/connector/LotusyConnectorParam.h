//
//  LotusyConnectorParam.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyConnectorParam : NSObject

- (id) initWithParam:(NSString*)uri
              method:(NSString*)method
             headers:(NSDictionary*)headers
                body:(NSDictionary*)body
                file:(NSData*)file;

- (NSString*) uri;

- (NSString*) method;

- (NSDictionary*) headers;

- (NSDictionary*) body;

- (NSData*) file;

@end
