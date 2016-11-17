//
//  ViewController.m
//  InstaKilo
//
//  Created by Tim Beals on 2016-11-16.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "Subject.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) UICollectionViewFlowLayout *smallLayout;
@property (nonatomic) NSArray *library;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];

    UIBarButtonItem *barButtonChangeLayout = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(clickedChangeLayout:)];
    self.navigationItem.rightBarButtonItem = barButtonChangeLayout;
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(200, 200);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.flowLayout.minimumInteritemSpacing = 15;
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
    
    self.collectionView.collectionViewLayout = self.flowLayout;
    
    self.smallLayout = [[UICollectionViewFlowLayout alloc] init];
    self.smallLayout.itemSize = CGSizeMake(50, 50);
    self.smallLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.smallLayout.minimumInteritemSpacing = 5;
    self.smallLayout.minimumLineSpacing = 5;
}

- (void)clickedChangeLayout:(UIBarButtonItem *)button
{
    UICollectionViewLayout *nextLayout = self.collectionView.collectionViewLayout == self.flowLayout ? self.smallLayout : self.flowLayout;
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView setCollectionViewLayout:nextLayout animated:YES];
}

#pragma - protocol methods -

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.library.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    Subject *subject = self.library[section];
    return subject.picturesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    Subject *subject = self.library[indexPath.section];
    cell.cellImage.image = subject.picturesArray[indexPath.row];
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        Subject *subject = self.library[indexPath.section];
        headerView.sectionLabel.text = subject.subjectTitle;
        return headerView;
    }
    return nil;
}

#pragma - setupData -

-(void)setupData
{
    self.library = @[
                     [Subject subjectWithSubject:@"Tara" andPictures:
                      @[[UIImage imageNamed:@"20160207_125759"],
                        [UIImage imageNamed:@"20160703_122921"]]],
                     [Subject subjectWithSubject:@"Ruby and Silas" andPictures:
                      @[[UIImage imageNamed:@"received_10154048271629993"],
                          [UIImage imageNamed:@"received_10154254030264993"],
                          [UIImage imageNamed:@"received_10154315440559993"],
                          [UIImage imageNamed:@"received_10154409394409012"],
                          [UIImage imageNamed:@"received_10154427708854012"],
                          [UIImage imageNamed:@"received_10154480658434012"],
                          [UIImage imageNamed:@"received_10154484771354012"],
                          [UIImage imageNamed:@"received_10154633046084012"]]],
                     [Subject subjectWithSubject:@"My Family" andPictures:
                      @[[UIImage imageNamed:@"received_10154434053589012"]]]
                         ];
}

@end
