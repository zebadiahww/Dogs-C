//
//  ZWW.h
//  DogsC
//
//  Created by Zebadiah Watson on 10/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWWBreed.h"
#import "ZWWSubBreeds.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZWWBreedController : NSObject

+(instancetype)sharedController;

-(void)fetchBreeds: (void (^)(NSArray<ZWWBreed *>*breeds))completion;

-(void)fetchBreedImageUrl: (ZWWBreed *)breed completion:(void (^)(NSArray *))completion;

-(void)fetchSubBreedImageUrl: (void(^)(NSString *))completion;

-(void)fetchImageData: (void (^)(NSData *))completion;



@end

NS_ASSUME_NONNULL_END
