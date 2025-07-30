// Define a spell constructor
function Spell(_name, _damage, _cooldown) constructor {
    name = _name;
    damage = _damage;
    cooldown = _cooldown;
    current_cooldown = 0;
    
    cast = function() {
        if (current_cooldown <= 0) {
            current_cooldown = cooldown;
            return damage;
        }
        return 0;
    };
    
    update = function() {
        if (current_cooldown > 0) current_cooldown--;
    };
}

// Create spells
fireball = new Spell("Fireball", 30, 60);
ice_shard = new Spell("Ice Shard", 20, 40);

// In Step Event:
fireball.update();
ice_shard.update();

// On casting:
damage = fireball.cast();