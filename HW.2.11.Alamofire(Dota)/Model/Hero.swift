//
//  Hero.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 24.05.2022.
//

import Foundation

struct Hero: Decodable {
     
    let localizedName: String?
    let primaryAttr: String?
    let attackType: String?
    let img: String?
    let icon: String?
    let roles: [String]?
    let moveSpeed: Int?
    let attackRange: Int?
}

/* JSON
"id":1,
 "name":"npc_dota_hero_antimage",
 "localized_name":"Anti-Mage",
 "primary_attr":"agi",
 "attack_type":"Melee",
 "roles":["Carry","Escape","Nuker"],
 "img":"/apps/dota2/images/dota_react/heroes/antimage.png?",
 "icon":"/apps/dota2/images/dota_react/heroes/icons/antimage.png?",
 "base_health":200,
 "base_health_regen":0.25,
 "base_mana":75,
 "base_mana_regen":0,
 "base_armor":0,
 "base_mr":25,
 "base_attack_min":29,
 "base_attack_max":33,
 "base_str":21,
 "base_agi":24,
 "base_int":12,
 "str_gain":1.6,
 "agi_gain":2.8,
 "int_gain":1.8,
 "attack_range":150,
 "projectile_speed":0,
 "attack_rate":1.4,
 "move_speed":310,
 "turn_rate":null,
 "cm_enabled":true,
 "legs":2,
 "hero_id":1,
 "turbo_picks":434041,
 "turbo_wins":220818,
 "pro_ban":718,
 "pro_win":79,
 "pro_pick":150,
 "1_pick":32930,
 "1_win":15841,
 "2_pick":47587,
 "2_win":22978,
 "3_pick":48943,
 "3_win":23822,
 "4_pick":37872,
 "4_win":18131,
 "5_pick":21655,
 "5_win":10333,
 "6_pick":10024,
 "6_win":4758,
 "7_pick":5127,
 "7_win":2381,
 "8_pick":2055,
 "8_win":988,
 "null_pick":2163192,
 "null_win":0},
*/

