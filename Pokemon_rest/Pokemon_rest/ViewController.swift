//
//  ViewController.swift
//  Pokemon_rest
//
//  Created by Amira Maythe Vasquez on 20/02/2020.
//  Copyright © 2020 desafio. All rights reserved.
//

import UIKit

struct PokemonName: Decodable {
    let name: String
}
struct Pokemons: Decodable {
    let results: [PokemonName]
}


class ViewController: UIViewController {

    var items = [PokemonName]()

    @IBOutlet weak var tableView: UITableView!



    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    func loadItems(){
        //informar a url da API que vai ser utilizada
        let urlPO = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        let urlRequest = URLRequest(url: urlPO)
        //estabeler uma sessão que vai ser conectar com essa url, para trazer a informação do serviço
        let dataTesk = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do{
        //trazendo a resposta para a variavel json
                //  let resultadoJson = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                let resultadosJson = try! JSONDecoder().decode(Pokemons.self, from: data!)
                print(resultadosJson)
                //fazer um recorrido na cadeia
                    for item in resultadosJson.results {
                        self.items.append(item)
                }
                self.tableView.reloadData()

            } catch let jsonError{
                print(jsonError)
            }
        }
        dataTesk.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.initCell(title: items[indexPath.row].name)

        return cell
    }

}
