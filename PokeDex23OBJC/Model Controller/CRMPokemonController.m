//
//  CRMPokemonController.m
//  PokeDex23OBJC
//
//  Created by Cameron Milliken on 1/1/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

#import "CRMPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon/";
@implementation CRMPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(CRMPokemon * _Nullable))completion

{
    //Ensure the completion is not nil
    if (!completion) {
        completion = ^(CRMPokemon *p){};
    }
    // Step 1) Create the URL from the Base and the search term
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    // Print the URL - For testing
    NSLog(@"%@", [searchURL absoluteString]);
    
    // Step 2) Start my dataTask with the completion and DON'T FORGET TO RESUME
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // Check for errors
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        // Check the Response
        if (response) {
            NSLog(@"%@", response);
        }
        // Get the data
        if (data) {
            NSDictionary *topLevelDictionary =  [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
            if (!topLevelDictionary || ![topLevelDictionary isKindOfClass:[NSDictionary class]]) {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            // If we made it here then I have successfully Parsed my JSON and should be ale to complete with a pokemon object
            
            CRMPokemon *pokemon = [[CRMPokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        }
    }] resume];
}
@end
