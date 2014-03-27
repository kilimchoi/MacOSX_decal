//
//  ASAsteroid.h
//  Asteroids
//
//  Created by Kilim Choi on 3/26/14.
//
//

#import <Foundation/Foundation.h>
#import "ASDrawable.h"
@interface ASAsteroid : ASDrawable {
    NSArray *smallerAsteroids;
}
- (id) initLarge;
- (void) update;
- (id) initMedium;
- (id) initSmall;
- (void) dealloc;
@end
