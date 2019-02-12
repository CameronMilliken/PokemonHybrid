//
//  CRMPokemon.h
//  PokeDex23OBJC
//
//  Created by Cameron Milliken on 1/1/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *pokemonName;
@property (nonatomic, readonly) NSInteger identifier;
// I need my abilities to be an array of strings... how do you do that when Nullability and typed collections don't work in OBJ C? Use Lightweight Generics
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities; //This is Lightweight Generics

-(instancetype)initWithPokemonName: (NSString *)name identifier:(NSInteger)identifier ablilities: (NSArray<NSString *> *)abilities;

@end

@interface CRMPokemon (JSONConvertable)

//let dictionary = [{string: ANY}] -> swift line of what is written below.
// init(with dictionary: [string])
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictioncary; //id is short had for any item


@end

NS_ASSUME_NONNULL_END
