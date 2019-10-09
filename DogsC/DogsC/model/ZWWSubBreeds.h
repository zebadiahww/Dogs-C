//
//  ZWWSubBreeds.h
//  DogsC
//
//  Created by Zebadiah Watson on 10/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWWSubBreeds : NSObject

@property (nonatomic, readonly, copy)NSString * name;
@property (nonatomic, readonly, copy)NSArray * imageURLs;

-(ZWWSubBreeds *)initWithName:(NSString *)name
                    imageURLs:(NSArray<NSString *> *)imageURLs;

@end

NS_ASSUME_NONNULL_END
