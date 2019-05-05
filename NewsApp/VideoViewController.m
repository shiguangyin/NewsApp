//
// Created by Masker on 2019-05-05.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "VideoViewController.h"


@interface VideoViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic) UICollectionView *collectionView;

@end


@implementation VideoViewController


- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected"];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"item"];
    [self.view addSubview:self.collectionView];

}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    __kindof UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize result;
    CGFloat viewWidth = self.view.bounds.size.width;
    if (indexPath.item % 3 == 0) {
        result = CGSizeMake(viewWidth, 150);
    } else {
        result = CGSizeMake((viewWidth - 10) / 2, 200);
    }

    return result;
}


@end