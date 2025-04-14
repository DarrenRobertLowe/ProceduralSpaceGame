///refreshStructureSprites()
// go through list of structures and activate their sprite calculation event.

var structures = global.environmentStructuresList;

for (var i=0; i<ds_list_size(structures); i++) {
    var instance = ds_list_find_value(structures, i);
    
    with(instance) {
        event_user(CALCULATE_SPRITE_EVENT);
    }
}
