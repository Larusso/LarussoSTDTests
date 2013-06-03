//
// Created by Larusso on 28.05.13.
// Copyright (c) 2013 larusso. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//
#define NELEMS(x)  (sizeof(x) / sizeof(x[0]))

#import <SenTestingKit/SenTestingKit.h>
#import "NSImageResizeTest.h"
#import "NSImage+Resize.h"

@implementation NSImageResizeTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    self.instance = nil;

    [super tearDown];
}

- (void)testScaleToFitDown
{

    NSSize sourceSizes[] = {CGSizeMake(50, 80), CGSizeMake(100, 200), CGSizeMake(500, 500), CGSizeMake(40, 200)};
    NSSize targetSizes[] = {CGSizeMake(20, 30), CGSizeMake(10, 80), CGSizeMake(50, 50), CGSizeMake(40, 20)};

    NSSize testResults[] = {CGSizeMake(18.75, 30), CGSizeMake(10, 20), CGSizeMake(50, 50), CGSizeMake(4, 20)};

    NSImage *resizedImage;
    int i;
    for (i = 0; i < NELEMS(sourceSizes); i++)
    {
        NSSize sourceSize = sourceSizes[i];
        NSSize targetSize = targetSizes[i];
        NSSize resultSize = testResults[i];

        self.instance = [[NSImage alloc] initWithSize:sourceSize];

        resizedImage = [self.instance imageScaledToFitSize:targetSize];
        STAssertNotNil(resizedImage, @"should return a image object");
        STAssertEquals(resizedImage.size.width, resultSize.width, @"image width should be equal to %d", resultSize.width);
        STAssertEquals(resizedImage.size.height, resultSize.height, @"image height should be equal to %d", resultSize.height);
    }
    resizedImage = nil;
}

- (void)testScaleToFitHeight
{
    NSSize sourceSizes[] = {CGSizeMake(50, 80), CGSizeMake(100, 200), CGSizeMake(500, 500), CGSizeMake(40, 200)};
    NSSize targetSizes[] = {CGSizeMake(20, 30), CGSizeMake(10, 80), CGSizeMake(50, 50), CGSizeMake(40, 20)};
    
    NSSize testResults[] = {CGSizeMake(18.75, 30), CGSizeMake(10, 80), CGSizeMake(50, 50), CGSizeMake(4, 20)};
    
    NSImage *resizedImage;
    int i;
    for (i = 0; i < NELEMS(sourceSizes); i++)
    {        
        NSSize sourceSize = sourceSizes[i];
        NSSize targetSize = targetSizes[i];
        NSSize resultSize = testResults[i];
        
        self.instance = [[NSImage alloc] initWithSize:sourceSize];
        resizedImage = [self.instance imageScaledToFitHeight:targetSize];
        STAssertNotNil(resizedImage, @"should return a image object");
        STAssertEquals(resizedImage.size.height, resultSize.height, nil);
        STAssertEquals(resizedImage.size.width, resultSize.width, nil);
    }
    resizedImage = nil;
}

- (void)testScaleToFitWidth
{
    NSSize sourceSizes[] = {CGSizeMake(50, 80), CGSizeMake(100, 200), CGSizeMake(500, 500), CGSizeMake(40, 200)};
    NSSize targetSizes[] = {CGSizeMake(20, 30), CGSizeMake(10, 80), CGSizeMake(50, 50), CGSizeMake(40, 20)};
    
    NSSize testResults[] = {CGSizeMake(20, 30), CGSizeMake(10, 20), CGSizeMake(50, 50), CGSizeMake(40, 20)};
    
    NSImage *resizedImage;
    int i;
    for (i = 0; i < NELEMS(sourceSizes); i++)
    {
        NSSize sourceSize = sourceSizes[i];
        NSSize targetSize = targetSizes[i];
        NSSize resultSize = testResults[i];
        
        self.instance = [[NSImage alloc] initWithSize:sourceSize];
        resizedImage = [self.instance imageScaledToFitWidth:targetSize];
        STAssertNotNil(resizedImage, @"should return a image object");
        STAssertEquals(resizedImage.size.height, resultSize.height, nil);
        STAssertEquals(resizedImage.size.width, resultSize.width, nil);
    }
    resizedImage = nil;
}


@end