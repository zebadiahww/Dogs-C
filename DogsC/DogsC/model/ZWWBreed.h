//
//  ZWWBreed.h
//  DogsC
//
//  Created by Zebadiah Watson on 10/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWWBreed : NSObject

@property (nonatomic, copy, readonly)NSString * name;
@property (nonatomic, copy, readonly, nullable)NSArray * subbreed;
@property (nonatomic, copy, readonly) NSArray * imageURLs;

-(ZWWBreed*) initWithName:(NSString *)name
                 subbreed:(NSArray<NSString *>*)subbreed
                imageURLs:(NSArray<NSString *>*)imageURLs;

@end

@interface ZWWBreed (JSONSerialization)

-(ZWWBreed *)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
