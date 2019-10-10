//
//  ZWW.m
//  DogsC
//
//  Created by Zebadiah Watson on 10/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWBreedController.h"
#import "ZWWBreed.h"
#import "ZWWSubBreeds.h"

static NSString * const kfetchBreedsBaseURLString = @"https://dog.ceo/api/breeds/list/all";
static NSString * const kFetchImageBreedBaseUrl = @"https://dog.ceo/api/breed";
static NSString * const kImagesComponent = @"images";


@implementation ZWWBreedController

+ (instancetype)sharedController
{
    static ZWWBreedController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ZWWBreedController new];
    });
    return sharedInstance;
}

- (void)fetchBreeds:(void (^)(NSArray<ZWWBreed *> * _Nonnull))completion
{
    NSURL *finalURL = [NSURL URLWithString:kfetchBreedsBaseURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(@[]);
            return;
        }
        
        if(response)
        {
            NSLog(@"error with response");
        }
        
        if (data)
        {
            NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (error)
            {
                NSLog(@"error parsing the data");
                completion(@[]);
                return;
            }
            //pulling the messagDictionary from the top level dictionary
            NSDictionary *messageDictionary = topLevelDictionary[@"message"];
            //create a place holder array to hold the breeds
            NSMutableArray *arrayOfBreeds = [NSMutableArray new];
            //(for in loop) for breed(id) in message dictionary
            for (id key in messageDictionary)
            {
                NSMutableArray * subbreeds = [NSMutableArray new];
                for (NSString *name in messageDictionary[key])
                {
                    ZWWSubBreeds * subbreed = [[ZWWSubBreeds alloc] initWithName: name  imageURLs:[NSMutableArray new]];
                    [subbreeds addObject:subbreed];
                }
                ZWWBreed * breed = [[ZWWBreed alloc] initWithName:key subbreed:subbreeds imageURLs:[NSMutableArray new]];
                [arrayOfBreeds addObject:breed];
            }
            completion(arrayOfBreeds);
            
        }
    }]resume];
}

- (void)fetchBreedImageUrl:(ZWWBreed *)breed completion:(void (^)(NSArray * _Nonnull))completion
{
    NSURL * baseURL  = [NSURL URLWithString:kFetchImageBreedBaseUrl];
    NSURL * breedURL = [baseURL URLByAppendingPathComponent: breed.name];
    NSURL * finalURL = [breedURL URLByAppendingPathComponent:kImagesComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(@[]);
            return;
        }
        
        if (data)
        {
            NSDictionary *imageDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (error)
            {
                NSLog(@"%@", error);
            }
            NSMutableArray *imageArray = imageDictionary[@"message"];
            completion(imageArray);
        }
    } ]resume];
}

- (void)fetchSubBreedImageUrl:(ZWWSubBreeds *)subbreed breed:(ZWWBreed *)breed completion:(void (^)(NSArray * _Nonnull))completion
{
    NSURL * baseURL  = [NSURL URLWithString:kFetchImageBreedBaseUrl];
    NSURL * breedURL = [baseURL URLByAppendingPathComponent: breed.name];
    NSURL * subbreedURL = [breedURL URLByAppendingPathComponent:subbreed.name];
    NSURL * finalURL = [subbreedURL URLByAppendingPathComponent:kImagesComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(@[]);
            return;
        }
        
        if (data)
        {
            NSDictionary *imageDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (error)
            {
                NSLog(@"%@", error);
            }
            NSMutableArray *imageArray = imageDictionary[@"message"];
            completion(imageArray);
        }
    } ]resume];
}


- (void)fetchImageDataFromURL:(NSString *)url completion:(void (^)(NSData * _Nullable))completion
{
    NSURL * finalURL = [NSURL URLWithString:url];
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            completion(data);
        }
    }]resume];
}
@end
