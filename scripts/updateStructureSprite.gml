// setup the surface
var tilesetWidth  = sprite_get_width(targetSprite);
var tilesetHeight = sprite_get_height(targetSprite);
var tileSurface   = surface_create(tilesetWidth, tilesetHeight);
surface_set_target(tileSurface);
draw_clear_alpha(c_black, 0); // clear the surface
draw_sprite(targetSprite, 0, 0, 0);

spriteFinal = sprite_create_from_surface(
    tileSurface,
    spriteColumn * spriteWidth,
    spriteRow    * spriteHeight,
    spriteWidth, spriteHeight,
    false, false, 0, 0
);
sprite_index = spriteFinal;

surface_reset_target();
surface_free(tileSurface);

updateSpriteRequired = false;
