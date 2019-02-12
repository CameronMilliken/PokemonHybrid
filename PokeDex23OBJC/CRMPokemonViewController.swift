//
//  CRMPokemonViewController.swift
//  PokeDex23OBJC
//
//  Created by Cameron Milliken on 1/1/19.
//  Copyright © 2019 Cameron Milliken. All rights reserved.
//

import UIKit

class CRMPokemonViewController: UIViewController {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var pokemonIDLabel: UILabel!
    
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    
    //Landing Pad
    var pokemon: CRMPokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonSearchBar.delegate = self
        CRMPokemonController.fetchPokemon(forSearchTerm: "Charizard") { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.updateViews()
                
            }
            
            
        }
        
    }
    
    func updateViews() {
        guard let pokemon = pokemon else {return}
        pokemonNameLabel.text = "Name: \(pokemon.pokemonName)".capitalized
        pokemonIDLabel.text = "ID: \(pokemon.identifier)"
        pokemonAbilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(separator: ", ").capitalized)
        
    }
}

extension CRMPokemonViewController: UISearchBarDelegate {
    //Searches every time you type something into the search bar. TextDidChange
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Fetch with searchText
        CRMPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.updateViews()
            
            }
        }
    }
}
