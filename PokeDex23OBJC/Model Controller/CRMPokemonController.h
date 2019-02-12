//
//  CRMPokemonController.h
//  PokeDex23OBJC
//
//  Created by Cameron Milliken on 1/1/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRMPokemon.h"
NS_ASSUME_NONNULL_BEGIN

@interface CRMPokemonController : NSObject

// Line below is this is swift -> static func fetchPokemon(for searchTerm: String, completion: ((Pokemon?) - (Void))?)
//+ Class func, - Instance func
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void(^_Nullable)(CRMPokemon * _Nullable))completion;  //The arrow states you are declaring a block

@end

NS_ASSUME_NONNULL_END
