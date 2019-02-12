//
//  CRMPokemon.m
//  PokeDex23OBJC
//
//  Created by Cameron Milliken on 1/1/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import "CRMPokemon.h"

@implementation CRMPokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier ablilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self) {
        _pokemonName = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self; 
}
@end

@implementation CRMPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    
    NSInteger identifier = [dictionary[@"id"] integerValue];
    
    NSArray *abilitiesDictionary = dictionary[@"abilities"];

    if (![name isKindOfClass: [NSString class]] || ![abilitiesDictionary isKindOfClass: [NSArray class]]) {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [NSMutableArray new];
    
    for (NSDictionary *dictionary in abilitiesDictionary){
        NSString *abilityName = dictionary[@"ability"][@"name"];
        if (!abilityName){
            continue;
        }
        [abilities addObject:abilityName];
    }
    return [self initWithPokemonName:name identifier:identifier ablilities:abilities];
    
}

@end
