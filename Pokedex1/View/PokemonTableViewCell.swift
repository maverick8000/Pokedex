//
//  PokemonTableViewCell.swift
//  Pokedex1
//
//  Created by Raul Barranco on 7/17/22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    static let reuseId = "\(PokemonTableViewCell.self)"
    
    lazy var pokemonImageVIew: UIImageView = {
        
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemPink
        imageView.image = UIImage(named: "pokeball")
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    lazy var pokeNameLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Pokemon name"
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        label.backgroundColor = .black
        label.textColor = .white
        return label
        
    }()
    
    lazy var pokeTypeLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Pokemon type"
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.backgroundColor = .systemIndigo
        label.textColor = .white
        return label
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        
        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStack = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        vStack.addArrangedSubview(self.pokeNameLabel)
        vStack.addArrangedSubview(self.pokeTypeLabel)
        
        hStack.addArrangedSubview(self.pokemonImageVIew)
        hStack.addArrangedSubview(vStack)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
        
    }
    
    func configure(pokemonName: ResultsName) {
        self.pokeNameLabel.text = pokemonName.name
    }
    
    func configure(pokemonTypes: PokeTypes) {
        self.pokeTypeLabel.text = pokemonTypes.type.name
    }
    
}
