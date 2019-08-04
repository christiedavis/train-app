//
//  TFStationCell.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFStationCell.h"
#import "CategoryCell.h"
#import "TFStopPoint.h"

@interface TFStationCell()

@property (strong, nonatomic) IBOutlet UILabel *stationName;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) TFStopPoint *stopPoint;

@end

@implementation TFStationCell

+ (NSString*)reuseIdentifier {
    return @"TFStationCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib: [UINib nibWithNibName: [CategoryCell reuseIdentifier] bundle: nil] forCellWithReuseIdentifier: [CategoryCell reuseIdentifier]];
}

- (void)setupWithStop:(TFStopPoint*) stopPoint {
    [self.stationName setText: stopPoint.commonName];
    self.stopPoint = stopPoint;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [[UICollectionViewCell alloc] init];
}

@end
