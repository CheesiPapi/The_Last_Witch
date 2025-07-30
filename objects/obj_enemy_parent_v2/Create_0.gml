// Define a constructor for an Enemy
function Enemy(_x, _y, _health) constructor {
    x = _x;
    y = _y;
    health = _health;
    
    move = function(x_offset, y_offset) {
        x += x_offset;
        y += y_offset;
    };
    
    take_damage = function(dmg) {
        health -= dmg;
        return health <= 0;
    };
}

// Create instances of Enemy
slime = new Enemy(100, 200, 30);
skeleton = new Enemy(300, 150, 50);

// Use them
slime.move(1, 0); // Moves slime right
if (skeleton.take_damage(20)) {
    // Skeleton died
}