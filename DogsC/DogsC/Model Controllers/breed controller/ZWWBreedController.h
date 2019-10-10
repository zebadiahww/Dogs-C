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

//HEY DUMMY DONT FORGET
@property(nonatomic, copy) NSArray<ZWWBreed *> * breeds;
@property(nonatomic, copy) NSArray<ZWWSubBreeds *> * subbreeds;



-(void)fetchBreeds: (void (^)(NSArray<ZWWBreed *>*breeds))completion;

-(void)fetchBreedImageUrl: (ZWWBreed *)breed completion:(void (^)(NSArray *))completion;

-(void)fetchSubBreedImageUrl: (ZWWSubBreeds *)subbreed
                       breed:(ZWWBreed *)breed
                  completion:(void(^)(NSArray *))completion;

-(void)fetchImageDataFromURL:(NSString *)url
                  completion: (void (^)(NSData * _Nullable imageData))completion;



@end

NS_ASSUME_NONNULL_END
