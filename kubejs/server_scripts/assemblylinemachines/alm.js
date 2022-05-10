onEvent('recipes', e => {
    //let atoAlloys = ['steel', 'invar', 'electrum', 'bronze', 'enderium', 'lumium', 'signalum', 'constantan', 'brass']
    let time = 100

    `${craftOverride[input] ?? 'alltheores'}:${input}_${type}`
    almAlloy(e, 'alltheores:invar_ingot', 1, { tag: 'forge:ingots/iron' }, { tag: 'forge:ingots/nickel' }, time*2)
    almAlloy(e, 'alltheores:electrum_ingot', 1, { tag: 'forge:ingots/gold' }, { tag: 'forge:ingots/silver' }, time*2)
    almAlloy(e, 'alltheores:bronze_ingot', 4, { tag: 'forge:ingots/copper', count: 3 }, { tag: 'forge:ingots/tin' }, time * 2)
    
    almPurify(e, 'alltheores:enderium_ingot', 4, { tag: 'forge:ingots/lead', count:3  }, { tag: 'forge:ender_pearls', count:4 }, { tag: 'forge:ingots/platinum'}, time * 3)
    almPurify(e, 'alltheores:lumium_ingot', 4, { tag: 'forge:storage_blocks/glowstone' }, { tag: 'forge:ingots/tin', count: 3 }, { tag: 'forge:ingots/silver' }, time * 3)
    almPurify(e, 'alltheores:signalum_ingot', 4, { tag: 'forge:ingots/copper', count: 3 }, { tag: 'forge:dusts/redstone', count: 4 }, { tag: 'forge:ingots/silver' }, time * 3)

    almAlloy(e, 'alltheores:signalum_ingot', 1, { tag: 'forge:ingots/iron' }, { tag: 'forge:ingots/nickel' }, time * 2)
    almAlloy(e, 'alltheores:constantan_ingot', 1, { tag: 'forge:ingots/copper' }, { tag: 'forge:ingots/nickel' }, time * 2)
    almAlloy(e, 'alltheores:brass_ingot', 4, { tag: 'forge:ingots/copper', count:3 }, { tag: 'forge:ingots/zinc' }, time * 2)

})
