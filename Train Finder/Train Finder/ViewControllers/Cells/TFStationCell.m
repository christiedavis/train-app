//
//  TFStationCell.m
//  Train Finder
//
//  Created by Christie Davis on 4/08/19.
//  Copyright © 2019 Christie-Davis. All rights reserved.
//

#import "TFStationCell.h"
#import "TFCategoryCell.h"
#import "TFStopPoint.h"

@interface TFStationCell()

@property (strong, nonatomic) IBOutlet UILabel *stationName;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) TFStopPoint *stopPoint;
@property (strong, nonatomic) NSArray<TFAdditionalProperties*>* features;

@property (weak, nonatomic) id<TFFacilitySelectionDelegate> selectionDelegate;

@end

@implementation TFStationCell

+ (NSString*)reuseIdentifier {
    return @"TFStationCell";
}

-(void)prepareForReuse {
    [super prepareForReuse];
    [self deselectAllFacilities];
}

- (void)deselectAllFacilities {
    for (NSIndexPath *indexPath in [self.collectionView indexPathsForSelectedItems]) {
        [self.collectionView deselectItemAtIndexPath: indexPath animated: YES];
    }
}

- (void)setup {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib: [UINib nibWithNibName: [TFCategoryCell reuseIdentifier] bundle: nil] forCellWithReuseIdentifier: [TFCategoryCell reuseIdentifier]];
    
}

- (void)setupWithStop: (TFStopPoint*) stopPoint andDelegate: (id<TFFacilitySelectionDelegate>) selectionDelegate {
    [self setup];
    [self.stationName setText: stopPoint.commonName];
    self.stopPoint = stopPoint;
    self.selectionDelegate = selectionDelegate;
    
    // The processing of facilities may be better handled elsewhere
    NSMutableArray<TFAdditionalProperties*>* validFeatures = [[NSMutableArray alloc] init];
    
    for (TFAdditionalProperties *feature in stopPoint.additionalProperties) {
        if ([feature.category isEqualToString: @"Facility"]) {
            [validFeatures addObject: feature];
        }
    }
    self.features = validFeatures;
   
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.features.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TFCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: [TFCategoryCell reuseIdentifier] forIndexPath: indexPath];
    [cell setup: self.features[indexPath.item]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Unfortunately this is not laying out quite right, could do with more time
    return [TFCategoryCell sizeWithText: self.features[indexPath.item].key withMaxWidth: [UIScreen mainScreen].bounds.size.width - 12];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectionDelegate facilitySelected: self.features[indexPath.item]];
}

@end
