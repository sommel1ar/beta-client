var prefix = "!$";
var cm = clientMessage;

// Hitbox Reducer
var hbx = 0.7;
var hby = 1.8;
var hbr = false;

// Knockback Reducer
var kbx = 94;
var kby = 98;
var kbz = 94;
var kbr = true;

// Your Hitbox Reducer
var yhbh = 0.6;
var yhby = 1.8;
var yhbr = false;

// FastEat
var kk = 32;

var reachOffs = [0x811f42, 0x812182];
var reachTbl = {"2":[0,0],"2.125":[0,1],"2.25":[0,2],"2.375":[0,3],"2.5":[0,4],"2.625":[0,5],"2.75":[0,6],"2.875":[0,7],"3":[0,8],"3.125":[0,9],"3.25":[0,10],"3.375":[0,11],"3.5":[0,12],"3.625":[0,13],"3.75":[0,14],"3.875":[0,15],"4":[1,0],"4.25":[1,1],"4.5":[1,2],"4.75":[1,3],"5":[1,4],"5.25":[1,5],"5.5":[1,6],"5.75":[1,7],"6":[1,8],"6.25":[1,9],"6.5":[1,10],"6.75":[1,11],"7":[1,12],"7.25":[1,13],"7.5":[1,14],"7.75":[1,15],"8":[2,0],"8.5":[2,1],"9":[2,2],"9.5":[2,3],"10":[2,4]};

var client = " §8[§aPhantom§8] §r";

function chatHook(msg) {
    var args = msg.split(" ");

    // Help
    if (msg == prefix + "help") {
        preventDefault();
        cm("     §8[§aPhantom§8]");
        cm(" ");
        cm("   §7- §f" + prefix + "hbr §2Hitbox Reducer");
        cm("   §7- §f" + prefix + "kbr §2KnockBack Reducer");
        cm("   §7- §f" + prefix + "yhbr §2Reduce your collision box");
        cm(" ");
        cm("   §7- §f" + prefix + "hb §8(§f0.7§8) (§f1.8§8) §2Hitbox");
        cm("   §7- §f" + prefix + "kb §8(§f94§8) (§f98§8) (§f94§8) §2KB §8(§fx y z§8)");
        cm("   §7- §f" + prefix + "setyhbr §8(§f0.6§8) (§f1.8§8) §2Your Hitbox");
        cm("   §7- §f" + prefix + "setpref §8(§fprefix§8) §2Change prefix");
        cm("   §7- §f" + prefix + "fasteat §8(§f32§8) §2Eat Speed");
        cm("   §7- §f" + prefix + "reach §8(§f3.0§8) §2Attack Reach");
        cm(" ");
        cm("   §7- §f" + prefix + "cheatinfo §2Info");
    }

    // Set prefix
    if (args[0] == prefix + "setpref") {
        preventDefault();
        prefix = args[1];
    }

    // Set hitbox values
    if (args[0] == prefix + "hb") {
        preventDefault();
        hbx = parseFloat(args[1]);
        hby = parseFloat(args[2]);
    }

    // Set KB values
    if (args[0] == prefix + "kb") {
        preventDefault();
        kbx = parseFloat(args[1]);
        kby = parseFloat(args[2]);
        kbz = parseFloat(args[3]);
    }

    // Set your hitbox values
    if (args[0] == prefix + "setyhbr") {
        preventDefault();
        yhbh = parseFloat(args[1]);
        yhby = parseFloat(args[2]);
    }

    // Cheat info
    if (msg == prefix + "cheatinfo") {
        preventDefault();
        cm(client + "§2Client: §fPhantom Client");
        cm(client + "§2Author: §fPuunish");
    }

    // Toggle: Your Hitbox Reducer
    if (msg == prefix + "yhbr") {
        preventDefault();
        if (yhbr == false) { yhbr = true; }
        else { yhbr = false; }
    }

    // Toggle: Hitbox Reducer
    if (msg == prefix + "hbr") {
        preventDefault();
        if (hbr == false) { hbr = true; }
        else { hbr = false; }
    }

    // Toggle: KB Reducer
    if (msg == prefix + "kbr") {
        preventDefault();
        if (kbr == false) { kbr = true; }
        else { kbr = false; }
    }

    if (args[0] == prefix + "fasteat") {
        preventDefault();
        kk = parseFloat(args[1]);
        fastEatOn(256);
    }

    if (args[0] == prefix + "reach") {
        preventDefault();
        reachSet(parseFloat(args[1]));
    }

    // Unknown command
    if (args[0] != prefix + "help" && args[0] != prefix + "hbr" && args[0] != prefix + "kbr" &&
        args[0] != prefix + "yhbr" && args[0] != prefix + "setyhbr" && args[0] != prefix + "setpref" &&
        args[0] != prefix + "fasteat" && args[0] != prefix + "hb" && args[0] != prefix + "kb" &&
        args[0] != prefix + "reach" && args[0] != prefix + "cheatinfo" &&
        args[0].startsWith(prefix)) {
        preventDefault();
    }
}

function modTick() {
    if (hbr == true) {
        Entity.setCollisionSize(Player.getPointedEntity(), hbx, hby);
    }

    if (kbr == true) {
        var curspeed = Math.sqrt(Math.pow(Entity.getVelX(getPlayerEnt()), 2) + Math.pow(Entity.getVelZ(getPlayerEnt()), 2));
        if (getTile(getPlayerX(), getPlayerY() - 2, getPlayerZ()) != 0) {
            if (curspeed > 0.30) {
                setVelX(getPlayerEnt(), Entity.getVelX(getPlayerEnt()) * kbx / 100);
                setVelY(getPlayerEnt(), Entity.getVelY(getPlayerEnt()) * kby / 100);
                setVelZ(getPlayerEnt(), Entity.getVelZ(getPlayerEnt()) * kbz / 100);
            }
        }
    }

    if (yhbr == true) {
        Entity.setCollisionSize(getPlayerEnt(), yhbh, yhby);
    }
}

function fastEatOn(id) {
    Item.setProperties(4 + id, {"name":"apple","id":4,"icon":"apple","category":"Miscellaneous","use_animation":"eat","use_duration":kk,"food":{"nutrition":4,"saturation_modifier":"low","is_meat":false}});
    Item.setProperties(66 + id, {"name":"golden_apple","id":66,"icon":"apple_golden","category":"Miscellaneous","stack_by_data":true,"use_animation":"eat","use_duration":kk,"foil":false,"hover_text_color":"aqua","food":{"nutrition":4,"saturation_modifier":"supernatural","is_meat":false,"effects":[{"name":"regeneration","chance":1.0,"duration":5,"amplifier":1},{"name":"absorption","chance":1.0,"duration":120,"amplifier":0}],"enchanted_effects":[{"name":"regeneration","chance":0.66,"duration":30,"amplifier":4},{"name":"absorption","chance":0.66,"duration":120,"amplifier":0},{"name":"resistance","chance":0.66,"duration":300,"amplifier":0},{"name":"fire_resistance","chance":0.66,"duration":300,"amplifier":0}]}});
    Item.setProperties(210 + id, {"name":"appleEnchanted","id":210,"icon":"apple_golden","category":"Miscellaneous","hand_equipped":false,"stack_by_data":true,"use_animation":"eat","use_duration":kk,"foil":true,"hover_text_color":"light_purple","food":{"nutrition":4,"saturation_modifier":"supernatural","is_meat":false,"effects":[{"name":"regeneration","chance":1.0,"duration":30,"amplifier":4},{"name":"absorption","chance":1.0,"duration":120,"amplifier":0},{"name":"resistance","chance":1.0,"duration":300,"amplifier":0},{"name":"fire_resistance","chance":1.0,"duration":300,"amplifier":0}]}});
    Item.setProperties(26 + id, {"name":"mushroom_stew","id":26,"icon":"mushroom_stew","category":"Miscellaneous","use_animation":"eat","use_duration":kk,"max_stack_size":1,"food":{"nutrition":6,"saturation_modifier":"normal","is_meat":false,"using_converts_to":"item.bowl"}});
    Item.setProperties(41 + id, {"name":"bread","id":41,"icon":"bread","category":"Miscellaneous","use_animation":"eat","use_duration":kk,"food":{"nutrition":5,"saturation_modifier":"normal","is_meat":false}});
    Item.setProperties(63 + id, {"name":"porkchop","id":63,"icon":"porkchop_raw","use_animation":"eat","use_duration":kk,"food":{"nutrition":3,"saturation_modifier":"low","is_meat":true}});
    Item.setProperties(64 + id, {"name":"porkchop_cooked","id":64,"icon":"porkchop_cooked","category":"Miscellaneous","use_animation":"eat","use_duration":kk,"food":{"nutrition":8,"saturation_modifier":"good","is_meat":true}});
    Item.setProperties(93 + id, {"name":"fish","id":93,"icon":"fish","use_animation":"eat","use_duration":kk,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":2,"saturation_modifier":"poor","is_meat":true}});
    Item.setProperties(204 + id, {"name":"salmon","id":204,"icon":"salmon","use_animation":"eat","use_duration":kk,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":2,"saturation_modifier":"poor","is_meat":true}});
    Item.setProperties(205 + id, {"name":"clownfish","id":205,"icon":"clownfish","use_animation":"eat","use_duration":kk,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":1,"saturation_modifier":"poor","is_meat":true}});
    Item.setProperties(206 + id, {"name":"pufferfish","id":206,"icon":"pufferfish","use_animation":"eat","use_duration":kk,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":1,"saturation_modifier":"poor","is_meat":true,"effects":[{"name":"poison","duration":60,"amplifier":3},{"name":"nausea","duration":15,"amplifier":1},{"name":"hunger","duration":15,"amplifier":2}]}});
    Item.setProperties(94 + id, {"name":"cooked_fish","id":94,"icon":"cooked_fish","use_animation":"eat","use_duration":kk,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":5,"saturation_modifier":"normal","eat_sound":"random.burp","is_meat":true}});
    Item.setProperties(207 + id, {"name":"cooked_salmon","id":207,"icon":"cooked_salmon","use_animation":"eat","use_duration":kk,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":6,"saturation_modifier":"good","is_meat":true}});
    Item.setProperties(101 + id, {"name":"cookie","id":101,"icon":"cookie","use_animation":"eat","use_duration":kk,"food":{"nutrition":2,"saturation_modifier":"poor","is_meat":false}});
    Item.setProperties(104 + id, {"name":"melon","id":104,"icon":"melon","use_animation":"eat","use_duration":kk,"food":{"nutrition":2,"saturation_modifier":"low","is_meat":false}});
    Item.setProperties(107 + id, {"name":"beef","id":107,"icon":"beef_raw","use_animation":"eat","use_duration":kk,"food":{"nutrition":3,"saturation_modifier":"low","is_meat":true}});
    Item.setProperties(108 + id, {"name":"steak","id":108,"icon":"beef_cooked","use_animation":"eat","use_duration":kk,"food":{"nutrition":8,"saturation_modifier":"good","is_meat":true}});
    Item.setProperties(109 + id, {"name":"chicken","id":109,"icon":"chicken_raw","use_animation":"eat","use_duration":kk,"food":{"nutrition":2,"saturation_modifier":"low","is_meat":true,"effects":[{"name":"hunger","chance":0.3,"duration":30,"amplifier":0}]}});
    Item.setProperties(110 + id, {"name":"cooked_chicken","id":110,"icon":"chicken_cooked","use_animation":"eat","use_duration":kk,"food":{"nutrition":6,"saturation_modifier":"normal","is_meat":true}});
    Item.setProperties(167 + id, {"name":"muttonRaw","id":167,"icon":"mutton_raw","use_animation":"eat","use_duration":kk,"food":{"nutrition":2,"saturation_modifier":"low","is_meat":true}});
    Item.setProperties(168 + id, {"name":"muttonCooked","id":168,"icon":"mutton_cooked","use_animation":"eat","use_duration":kk,"food":{"nutrition":6,"saturation_modifier":"good","is_meat":true}});
    Item.setProperties(111 + id, {"name":"rotten_flesh","id":111,"icon":"rotten_flesh","use_animation":"eat","use_duration":kk,"food":{"nutrition":4,"saturation_modifier":"poor","is_meat":true,"effects":[{"name":"hunger","chance":0.3,"duration":30,"amplifier":0}]}});
    Item.setProperties(119 + id, {"name":"spider_eye","id":119,"icon":"spider_eye","use_animation":"eat","use_duration":kk,"food":{"nutrition":2,"saturation_modifier":"good","is_meat":false,"effects":[{"name":"poison","chance":1.0,"duration":5,"amplifier":0}]}});
    Item.setProperties(135 + id, {"name":"carrot","id":135,"icon":"carrot","use_animation":"eat","use_duration":kk,"food":{"nutrition":3,"saturation_modifier":"normal","is_meat":false},"seed":{"crop_result":"carrots","plant_at":"farmland"}});
    Item.setProperties(136 + id, {"name":"potato","id":136,"icon":"potato","use_animation":"eat","use_duration":kk,"food":{"nutrition":1,"saturation_modifier":"low","is_meat":false},"seed":{"crop_result":"potatoes","plant_at":"farmland"}});
    Item.setProperties(137 + id, {"name":"baked_potato","id":137,"icon":"potato_baked","use_animation":"eat","use_duration":kk,"food":{"nutrition":5,"saturation_modifier":"normal","is_meat":false}});
    Item.setProperties(138 + id, {"name":"poisonous_potato","id":138,"icon":"potato_poisonous","use_animation":"eat","use_duration":kk,"food":{"nutrition":2,"saturation_modifier":"low","is_meat":false,"effects":[{"name":"poison","chance":0.6,"duration":5,"amplifier":0}]}});
    Item.setProperties(140 + id, {"name":"golden_carrot","id":140,"icon":"carrot_golden","category":"Miscellaneous","use_animation":"eat","use_duration":kk,"food":{"nutrition":6,"saturation_modifier":"supernatural","is_meat":false}});
    Item.setProperties(144 + id, {"name":"pumpkin_pie","id":144,"icon":"pumpkin_pie","use_animation":"eat","use_duration":kk,"food":{"nutrition":8,"saturation_modifier":"low","is_meat":false}});
    Item.setProperties(155 + id, {"name":"rabbit","id":155,"icon":"rabbit","category":"Miscellaneous","use_animation":"eat","use_duration":kk,"food":{"nutrition":3,"saturation_modifier":"low","is_meat":true}});
    Item.setProperties(156 + id, {"name":"cooked_rabbit","id":156,"icon":"rabbit_cooked","category":"Miscellaneous","use_animation":"eat","use_duration":kk,"food":{"nutrition":5,"saturation_modifier":"normal","is_meat":true}});
    Item.setProperties(157 + id, {"name":"rabbit_stew","id":157,"icon":"rabbit_stew","category":"Miscellaneous","use_animation":"eat","use_duration":kk,"max_stack_size":1,"food":{"nutrition":10,"saturation_modifier":"normal","using_converts_to":"bowl","is_meat":true}});
    Item.setProperties(201 + id, {"name":"beetroot","id":201,"icon":"beetroot","use_animation":"eat","use_duration":kk,"food":{"nutrition":1,"saturation_modifier":"normal","is_meat":false}});
    Item.setProperties(203 + id, {"name":"beetroot_soup","id":203,"icon":"beetroot_soup","use_animation":"eat","use_duration":kk,"max_stack_size":1,"food":{"nutrition":6,"saturation_modifier":"normal","using_converts_to":"bowl","is_meat":false}});
}

function reachNearest(v) {
    var best = "3.25", bd = 1e9;
    for (var k in reachTbl) {
        var d = v - parseFloat(k);
        if (d < 0) { d = -d; }
        if (d < bd) { bd = d; best = k; }
    }
    return best;
}

function reachSet(v) {
    try {
        var key = reachTbl["" + v] ? "" + v : reachNearest(v);
        var nib = reachTbl[key];
        var seg = -1, so = -1;
        var br = new Packages.java.io.BufferedReader(new Packages.java.io.FileReader("/proc/self/maps"));
        var ln;
        while ((ln = br.readLine()) != null) {
            var s = "" + ln;
            if (s.indexOf("libminecraftpe.so") >= 0) {
                var p = s.split(" ");
                if (p[1].indexOf("x") >= 0) {
                    seg = parseInt(p[0].split("-")[0], 16);
                    so = parseInt(p[2], 16);
                    break;
                }
            }
        }
        br.close();
        if (seg < 0) { return; }
        var uc = Packages.java.lang.Class.forName("sun.misc.Unsafe");
        var uf = uc.getDeclaredField("theUnsafe");
        uf.setAccessible(true);
        var u = uf.get(null);
        var b0 = 0x80 | nib[0], b2 = 0x10 | nib[1];
        for (var i = 0; i < reachOffs.length; i++) {
            var a = seg + (reachOffs[i] - so);
            var c0 = u.getByte(a) & 0xFF, c1 = u.getByte(a + 1) & 0xFF, c2 = u.getByte(a + 2) & 0xFF;
            if (c1 != 0xEF || (c0 & 0xF0) != 0x80 || (c2 & 0xF0) != 0x10) { continue; }
            u.putByte(a, (b0 > 127 ? b0 - 256 : b0));
            u.putByte(a + 2, (b2 > 127 ? b2 - 256 : b2));
        }
    } catch (e) {}
}

function fastEatOff(id) {
    Item.setProperties(4 + id, {"name":"apple","id":4,"icon":"apple","category":"Miscellaneous","use_animation":"eat","use_duration":32,"food":{"nutrition":4,"saturation_modifier":"low","is_meat":false}});
    Item.setProperties(66 + id, {"name":"golden_apple","id":66,"icon":"apple_golden","category":"Miscellaneous","stack_by_data":true,"use_animation":"eat","use_duration":32,"foil":false,"hover_text_color":"aqua","food":{"nutrition":4,"saturation_modifier":"supernatural","is_meat":false,"effects":[{"name":"regeneration","chance":1.0,"duration":5,"amplifier":1},{"name":"absorption","chance":1.0,"duration":120,"amplifier":0}],"enchanted_effects":[{"name":"regeneration","chance":0.66,"duration":30,"amplifier":4},{"name":"absorption","chance":0.66,"duration":120,"amplifier":0},{"name":"resistance","chance":0.66,"duration":300,"amplifier":0},{"name":"fire_resistance","chance":0.66,"duration":300,"amplifier":0}]}});
    Item.setProperties(210 + id, {"name":"appleEnchanted","id":210,"icon":"apple_golden","category":"Miscellaneous","hand_equipped":false,"stack_by_data":true,"use_animation":"eat","use_duration":32,"foil":true,"hover_text_color":"light_purple","food":{"nutrition":4,"saturation_modifier":"supernatural","is_meat":false,"effects":[{"name":"regeneration","chance":1.0,"duration":30,"amplifier":4},{"name":"absorption","chance":1.0,"duration":120,"amplifier":0},{"name":"resistance","chance":1.0,"duration":300,"amplifier":0},{"name":"fire_resistance","chance":1.0,"duration":300,"amplifier":0}]}});
    Item.setProperties(26 + id, {"name":"mushroom_stew","id":26,"icon":"mushroom_stew","category":"Miscellaneous","use_animation":"eat","use_duration":32,"max_stack_size":1,"food":{"nutrition":6,"saturation_modifier":"normal","is_meat":false,"using_converts_to":"item.bowl"}});
    Item.setProperties(41 + id, {"name":"bread","id":41,"icon":"bread","category":"Miscellaneous","use_animation":"eat","use_duration":32,"food":{"nutrition":5,"saturation_modifier":"normal","is_meat":false}});
    Item.setProperties(63 + id, {"name":"porkchop","id":63,"icon":"porkchop_raw","use_animation":"eat","use_duration":32,"food":{"nutrition":3,"saturation_modifier":"low","is_meat":true}});
    Item.setProperties(64 + id, {"name":"porkchop_cooked","id":64,"icon":"porkchop_cooked","category":"Miscellaneous","use_animation":"eat","use_duration":32,"food":{"nutrition":8,"saturation_modifier":"good","is_meat":true}});
    Item.setProperties(93 + id, {"name":"fish","id":93,"icon":"fish","use_animation":"eat","use_duration":32,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":2,"saturation_modifier":"poor","is_meat":true}});
    Item.setProperties(204 + id, {"name":"salmon","id":204,"icon":"salmon","use_animation":"eat","use_duration":32,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":2,"saturation_modifier":"poor","is_meat":true}});
    Item.setProperties(205 + id, {"name":"clownfish","id":205,"icon":"clownfish","use_animation":"eat","use_duration":32,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":1,"saturation_modifier":"poor","is_meat":true}});
    Item.setProperties(206 + id, {"name":"pufferfish","id":206,"icon":"pufferfish","use_animation":"eat","use_duration":32,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":1,"saturation_modifier":"poor","is_meat":true,"effects":[{"name":"poison","duration":60,"amplifier":3},{"name":"nausea","duration":15,"amplifier":1},{"name":"hunger","duration":15,"amplifier":2}]}});
    Item.setProperties(94 + id, {"name":"cooked_fish","id":94,"icon":"cooked_fish","use_animation":"eat","use_duration":32,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":5,"saturation_modifier":"normal","eat_sound":"random.burp","is_meat":true}});
    Item.setProperties(207 + id, {"name":"cooked_salmon","id":207,"icon":"cooked_salmon","use_animation":"eat","use_duration":32,"max_damage":0,"stacked_by_data":true,"food":{"nutrition":6,"saturation_modifier":"good","is_meat":true}});
    Item.setProperties(101 + id, {"name":"cookie","id":101,"icon":"cookie","use_animation":"eat","use_duration":32,"food":{"nutrition":2,"saturation_modifier":"poor","is_meat":false}});
    Item.setProperties(104 + id, {"name":"melon","id":104,"icon":"melon","use_animation":"eat","use_duration":32,"food":{"nutrition":2,"saturation_modifier":"low","is_meat":false}});
    Item.setProperties(107 + id, {"name":"beef","id":107,"icon":"beef_raw","use_animation":"eat","use_duration":32,"food":{"nutrition":3,"saturation_modifier":"low","is_meat":true}});
    Item.setProperties(108 + id, {"name":"steak","id":108,"icon":"beef_cooked","use_animation":"eat","use_duration":32,"food":{"nutrition":8,"saturation_modifier":"good","is_meat":true}});
    Item.setProperties(109 + id, {"name":"chicken","id":109,"icon":"chicken_raw","use_animation":"eat","use_duration":32,"food":{"nutrition":2,"saturation_modifier":"low","is_meat":true,"effects":[{"name":"hunger","chance":0.3,"duration":30,"amplifier":0}]}});
    Item.setProperties(110 + id, {"name":"cooked_chicken","id":110,"icon":"chicken_cooked","use_animation":"eat","use_duration":32,"food":{"nutrition":6,"saturation_modifier":"normal","is_meat":true}});
    Item.setProperties(167 + id, {"name":"muttonRaw","id":167,"icon":"mutton_raw","use_animation":"eat","use_duration":32,"food":{"nutrition":2,"saturation_modifier":"low","is_meat":true}});
    Item.setProperties(168 + id, {"name":"muttonCooked","id":168,"icon":"mutton_cooked","use_animation":"eat","use_duration":32,"food":{"nutrition":6,"saturation_modifier":"good","is_meat":true}});
    Item.setProperties(111 + id, {"name":"rotten_flesh","id":111,"icon":"rotten_flesh","use_animation":"eat","use_duration":32,"food":{"nutrition":4,"saturation_modifier":"poor","is_meat":true,"effects":[{"name":"hunger","chance":0.3,"duration":30,"amplifier":0}]}});
    Item.setProperties(119 + id, {"name":"spider_eye","id":119,"icon":"spider_eye","use_animation":"eat","use_duration":32,"food":{"nutrition":2,"saturation_modifier":"good","is_meat":false,"effects":[{"name":"poison","chance":1.0,"duration":5,"amplifier":0}]}});
    Item.setProperties(135 + id, {"name":"carrot","id":135,"icon":"carrot","use_animation":"eat","use_duration":32,"food":{"nutrition":3,"saturation_modifier":"normal","is_meat":false},"seed":{"crop_result":"carrots","plant_at":"farmland"}});
    Item.setProperties(136 + id, {"name":"potato","id":136,"icon":"potato","use_animation":"eat","use_duration":32,"food":{"nutrition":1,"saturation_modifier":"low","is_meat":false},"seed":{"crop_result":"potatoes","plant_at":"farmland"}});
    Item.setProperties(137 + id, {"name":"baked_potato","id":137,"icon":"potato_baked","use_animation":"eat","use_duration":32,"food":{"nutrition":5,"saturation_modifier":"normal","is_meat":false}});
    Item.setProperties(138 + id, {"name":"poisonous_potato","id":138,"icon":"potato_poisonous","use_animation":"eat","use_duration":32,"food":{"nutrition":2,"saturation_modifier":"low","is_meat":false,"effects":[{"name":"poison","chance":0.6,"duration":5,"amplifier":0}]}});
    Item.setProperties(140 + id, {"name":"golden_carrot","id":140,"icon":"carrot_golden","category":"Miscellaneous","use_animation":"eat","use_duration":32,"food":{"nutrition":6,"saturation_modifier":"supernatural","is_meat":false}});
    Item.setProperties(144 + id, {"name":"pumpkin_pie","id":144,"icon":"pumpkin_pie","use_animation":"eat","use_duration":32,"food":{"nutrition":8,"saturation_modifier":"low","is_meat":false}});
    Item.setProperties(155 + id, {"name":"rabbit","id":155,"icon":"rabbit","category":"Miscellaneous","use_animation":"eat","use_duration":32,"food":{"nutrition":3,"saturation_modifier":"low","is_meat":true}});
    Item.setProperties(156 + id, {"name":"cooked_rabbit","id":156,"icon":"rabbit_cooked","category":"Miscellaneous","use_animation":"eat","use_duration":32,"food":{"nutrition":5,"saturation_modifier":"normal","is_meat":true}});
    Item.setProperties(157 + id, {"name":"rabbit_stew","id":157,"icon":"rabbit_stew","category":"Miscellaneous","use_animation":"eat","use_duration":32,"max_stack_size":1,"food":{"nutrition":10,"saturation_modifier":"normal","using_converts_to":"bowl","is_meat":true}});
    Item.setProperties(201 + id, {"name":"beetroot","id":201,"icon":"beetroot","use_animation":"eat","use_duration":32,"food":{"nutrition":1,"saturation_modifier":"normal","is_meat":false}});
    Item.setProperties(203 + id, {"name":"beetroot_soup","id":203,"icon":"beetroot_soup","use_animation":"eat","use_duration":32,"max_stack_size":1,"food":{"nutrition":6,"saturation_modifier":"normal","using_converts_to":"bowl","is_meat":false}});
}
