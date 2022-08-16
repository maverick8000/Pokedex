//
//  MainViewController.swift
//  Pokedex1
//
//  Created by Raul Barranco on 7/17/22.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var pokemonTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.backgroundColor = .black
        table.delegate = self
        //Register Cell
        table.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.reuseId)
        return table
    }()
    
    let network: NetworkManager = NetworkManager()
    var pokemonNames: [ResultsName] = []
    var pokemonProfiles: [PokeTypes] = []
    var pokemonAbilities: [Abilities] = []
    var pokemonMoves: [Moves] = []
    var counter: Int = 0
    var myLimit: Int = 30
    
    var nameCache: [Int: String] = [:]
    var imageCache: [Int: Data] = [:]
    var typeCache: [Int: String] = [:]
    var abilityArr: [String] = []
    var abilityCache: [Int: [String]] = [:]
    var moveCache: [Int: [String]] = [:]
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
        
        self.requestPage()
        
    }
    
    private func requestPage() {
        
        //self.network.fetchPage2(urlStr: "https://pokeapi.co/api/v2/pokemon?offset=\(self.currentPage*30)&limit=\(self.currentPage + 30)") { result in
        //self.network.fetchPage2(urlStr: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151") { result in
        self.network.fetchPage2(urlStr: "https://pokeapi.co/api/v2/pokemon?offset=\(self.currentPage*30)&limit=\(self.myLimit)") { result in
            
                    print("\n\n\n\n\n00000##############################################################")
                    print(self.currentPage)
                    print("##############################################################11111\n\n\n\n\n")
            
            if self.currentPage*30 >= 120 {
                self.myLimit = 1
            }
            if self.currentPage >= 6 {
                return
            }
            
            switch result {
                
                case .success(let page):
                    //print((page),"\n\n\n\n\n\n")
                    self.currentPage += 1
                    //self.pokemonNames = page.results
                    self.pokemonNames.append(contentsOf: page.results)
                    //self.nameCache[self.pokemonNames[inde]]
                DispatchQueue.main.async {
                    self.pokemonTable.reloadData()
                }
                    
                case .failure(let error):
                    print(error)
                
            }
            
        }
        
    }
    
    private func setUpUI() {
        
        //self.view.backgroundColor = UIColor(red: 1.00, green: 0.84, blue: 0.80, alpha: 1.00)
        //self.view.backgroundColor = UIColor(red: 0.86, green: 0.80, blue: 1.00, alpha: 1.00)
        //self.view.backgroundColor = UIColor(red: 1.00, green: 0.80, blue: 0.80, alpha: 1.00)
        //self.view.backgroundColor = UIColor(red: 1.00, green: 0.10, blue: 0.10, alpha: 1.00)
        self.view.backgroundColor = .white
        self.view.addSubview(self.pokemonTable)
        self.pokemonTable.bindToSuperView()
        
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.reuseId, for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(pokemonName: self.pokemonNames[indexPath.row])
        
        self.nameCache[indexPath.row] = self.pokemonNames[indexPath.row].name
        //self.typeCache[indexPath.row] = self.pokemonProfiles[indexPath.row].type.name
        
//        print("\n\n\n\n\n##############################################################")
//        print(nameCache)
//        print("##############################################################\n\n\n\n\n")
        
        
        self.network.fetchPage(urlStr: "https://pokeapi.co/api/v2/pokemon/\(indexPath.row + 1)") { (result: Result<PokemonProfile, Error>) in
            
            switch result {
                
                case .success(let page):
                    self.pokemonProfiles = page.types
                self.pokemonAbilities = page.abilities
                self.pokemonMoves = page.moves
                
                    DispatchQueue.main.async {
                        //self.pokemonTable.reloadData()
                        cell.configure(pokemonTypes: self.pokemonProfiles[0])
//                                print("\n\n\n\n\n##############################################################")
//                                print(indexPath.row)
//                                print("##############################################################\n\n\n\n\n")
                        self.typeCache[indexPath.row] = self.pokemonProfiles[0].type.name
                        
                        //self.abilityCache[indexPath.row] = self.pokemonAbilities[]
                        print("\n\n\n\n\n##############################################################")
                        //print(self.pokemonAbilities[0])
                        //print(self.pokemonAbilities.count)
                        //print(page.name)
                        var tempArr2: [String] = []
//                        if self.pokemonAbilities.count > 0
//                        {
                        for index in 0..<self.pokemonAbilities.count {
                            print(self.pokemonAbilities[index])
                            tempArr2.append(self.pokemonAbilities[index].ability.name)
//                        }
                        }
                        self.abilityCache[indexPath.row] = tempArr2
                        print("##############################################################\n\n\n\n\n")
                        
                        print("\n\n\n\n\n##############################################################")
                        var tempArr3: [String] = []
                        for index in 0..<self.pokemonMoves.count {
                            //print(self.pokemonMoves[index])
                            tempArr3.append(self.pokemonMoves[index].move.name)
                        }
                        self.moveCache[indexPath.row] = tempArr3
                        print("##############################################################\n\n\n\n\n")
                        
                    }
                case .failure(let error):
                    print(error)
                
            }
            
        }
    
        //self.imageCache[indexPath.row] = self.pokemonProfiles[indexPath.row].
        
        self.network.fetchImage(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/\(indexPath.row + 1).png") { result in
            
            switch result {
            case .success(let imageData):
            
                DispatchQueue.main.async {
                   
                    cell.pokemonImageVIew.image = UIImage(data: imageData)
                    self.imageCache[indexPath.row] = imageData
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        
//        if let nameData = self.nameCache[self.pokemonNames[indexPath.row].name] {
//            cell.pokeNameLabel.text = nameData
//            return cell
//        }
        
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController(text: nameCache[indexPath.row] ?? "pokeball", imageData: imageCache[indexPath.row]!, typeString: typeCache[indexPath.row] ?? "None", abilityStringArr: self.abilityCache[indexPath.row]!, moveStringArr: self.moveCache[indexPath.row]!)
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.navigationController?.navigationBar.tintColor = .white
    
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
                if indexPath.row == self.pokemonNames.count - 1 {
                    self.requestPage()
                }
        
    }
    
}
