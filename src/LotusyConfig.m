//
//  LotusyConfig.m
//  LotusyConfig
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyConfig.h"
#import "LotusyToken.h"

@interface LotusyConfig()

@end


@implementation LotusyConfig

static ENVIRONMENT env;
static NSString* language = @"en";
static NSString* appKey = nil;

+ (void) setup:(ENVIRONMENT)environment
      language:(NSString*)applicationLanguage
        appKey:(NSString*)applicationKey {
    env = environment;
    language = applicationLanguage;
    appKey = applicationKey;
}

+ (NSDictionary*) defaultHeaders {
    NSMutableDictionary* header = [[NSMutableDictionary alloc]init];
    [header setObject:@"application/json" forKey:@"Content-Type"];
    [header setObject:appKey forKey:@"app-key"];
    LotusyToken* token = [LotusyToken current];
    if (token!=nil) {
        [header setObject:[NSString stringWithFormat:@"Bearer %@", token.accessToken] forKey:@"Authorization"];
    }

    return header;
}

+ (NSDictionary*) imageHeaders {
    NSMutableDictionary* header = [[NSMutableDictionary alloc]init];
    [header setObject:@"image/png" forKey:@"Content-Type"];
    [header setObject:appKey forKey:@"app-key"];
    LotusyToken* token = [LotusyToken current];
    if (token!=nil) {
        [header setObject:[NSString stringWithFormat:@"Bearer %@", token] forKey:@"Authorization"];
    }

    return header;
}

+ (ENVIRONMENT) currentEnvironment {
    return env;
}

+ (NSString*) currentLanguage {
    return language;
}

+ (NSString*) currentAppKey {
    return appKey;
}

@end
