//
//  ZWWBreed.m
//  DogsC
//
//  Created by Zebadiah Watson on 10/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWBreed.h"

@implementation ZWWBreed

- (ZWWBreed *)initWithName:(NSString *)name subbreed:(NSArray<ZWWSubBreeds *> *)subbreed imageURLs:(NSArray<NSString *> *)imageURLs
{

    self = [super init];
    if (self)
    {
        _name = name;
        _subbreeds = subbreed;
        _imageURLs = imageURLs;
    }
    return self;
}

@end 
