//
//  ASAsteroid.m
//  Asteroids
//
//  Created by Kilim Choi on 3/26/14.
//
//

#import "ASAsteroid.h"
#import "ASShip.h"
#import "ASBullet.h"

@implementation ASAsteroid


- (id) initLarge {
    [super initWithImage:[NSImage imageNamed:@"asteroidLarge"]];
    ASAsteroid *asteroid1 = [[ASAsteroid alloc] initMedium];
    ASAsteroid *asteroid2 = [[ASAsteroid alloc] initMedium];
    smallerAsteroids = [[NSArray alloc] initWithObjects:asteroid1, asteroid2, nil];
    [asteroid1 autorelease];
    [asteroid2 autorelease];
    return self;
}


-(void) update {
    for (ASDrawable *drawable in self.view.drawables) {
        if ([drawable isKindOfClass: [ASShip class]] && [drawable collidesWith: self]) {
            if (![drawable shield])
                [drawable die];
        }
    }
    for (ASDrawable *drawable in self.view.drawables) {
        if ([drawable isKindOfClass: [ASBullet class]] && [drawable collidesWith: self]) {
            for (ASAsteroid *smallerAsteroid in smallerAsteroids) {
                smallerAsteroid.x = self.x;
                smallerAsteroid.y = self.y;
                smallerAsteroid.xVelocity = self.xVelocity + (rand() % 7) - 3;
                smallerAsteroid.yVelocity = self.yVelocity + (rand() % 7) - 3;
                [self.view addDrawable: smallerAsteroid];
            }
            [self die];
        }
    }
}
- (id) initMedium {
    [super initWithImage:[NSImage imageNamed:@"asteroidMedium"]];
    ASAsteroid *asteroid3 = [[ASAsteroid alloc] initSmall];
    ASAsteroid *asteroid4 = [[ASAsteroid alloc] initSmall];
    ASAsteroid *asteroid5 = [[ASAsteroid alloc] initSmall];
    smallerAsteroids = [[NSArray alloc] initWithObjects:asteroid3, asteroid4, asteroid5, nil];
    [asteroid3 autorelease];
    [asteroid4 autorelease];
    [asteroid5 autorelease];
    return self;
}
- (id) initSmall {
    [super initWithImage:[NSImage imageNamed:@"asteroidSmall"]];
    smallerAsteroids = [[NSArray alloc] init];
    return self;
}
- (void) dealloc {
    [smallerAsteroids release];
    [super dealloc];
}
@end
