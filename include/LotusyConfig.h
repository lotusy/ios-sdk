//
//  LotusyConfig.h
//  LotusyConfig
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyConfig : NSObject

typedef enum { DEV, TEST, INT, STAG, PROD } ENVIRONMENT;

+ (void) setup:(ENVIRONMENT)env
      language:(NSString*)applicationLanguage
        appKey:(NSString*)applicationKey;

+ (NSDictionary*) defaultHeaders;

+ (NSDictionary*) imageHeaders;

+ (ENVIRONMENT) currentEnvironment;

+ (NSString*) currentLanguage;

+ (NSString*) currentAppKey;

@end
