//
//  Subject.h
//  InstaKilo
//
//  Created by Tim Beals on 2016-11-16.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject

@property (strong, nonatomic) NSString *subjectTitle;
@property (strong, nonatomic) NSArray *picturesArray;

- (instancetype)initWithSubject:(NSString *)subject andPictures:(NSArray *)pictures;
+ (instancetype)subjectWithSubject:(NSString *)subject andPictures:(NSArray *)pictures;

@end
