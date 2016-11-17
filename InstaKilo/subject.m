//
//  Subject.m
//  InstaKilo
//
//  Created by Tim Beals on 2016-11-16.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "subject.h"

@implementation Subject

- (instancetype)initWithSubject:(NSString *)subject andPictures:(NSArray *)pictures
{
    self = [super init];
    if(self)
    {
        _subjectTitle = subject;
        _picturesArray = pictures;
    }
    return self;
}

+ (instancetype)subjectWithSubject:(NSString *)subject andPictures:(NSArray *)pictures
{
    return [[self alloc] initWithSubject:subject andPictures:pictures];
}

@end
