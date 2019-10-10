//
//  ZWWSubBreeds.m
//  DogsC
//
//  Created by Zebadiah Watson on 10/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWSubBreeds.h"

@implementation ZWWSubBreeds

- (ZWWSubBreeds *)initWithName:(NSString *)name imageURLs:(NSArray<NSString *> *)imageURLs{
    self = [super init];
    if (self)
    {
        _name = name;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
