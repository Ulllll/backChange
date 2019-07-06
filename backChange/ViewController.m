//
//  ViewController.m
//  customLayout
//
//  Created by Анастасия Рябова on 02/06/2019.
//  Copyright © 2019 Анастасия Рябова. All rights reserved.
//

#import "ViewController.h"
#import "CustomViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray<NSString *> *moreTitle;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *collectionViewLayout = [UICollectionViewFlowLayout new];
    collectionViewLayout.minimumInteritemSpacing = 10.f;
    collectionViewLayout.minimumLineSpacing = 10.f;
    collectionViewLayout.itemSize = CGSizeMake(180.f, 180.f);
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.moreTitle = @[@"First", @"Second", @"Third", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine"];
    
    [self.collectionView registerClass:[CustomViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class])];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.collectionView.frame = CGRectMake(0.f, 0.f, CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds)+CGRectGetWidth(self.view.bounds));
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.moreTitle.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomViewCell class]) forIndexPath:indexPath];
    
    NSString *title = self.moreTitle[indexPath.row];
    
    cell.backgroundColor = [UIColor blueColor];
    cell.title = title;
    
    collectionView.allowsMultipleSelection = NO;
    collectionView.allowsSelection = YES;
    [collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
}


@end
