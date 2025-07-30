// Create a struct with properties
player_stats = {
    health: 100,
    mana: 50,
    speed: 3,
    //  is_alive: true
    
    // Method to take damage
    
    take_damage: function(damage) {
        this.health -= damage;
        if (this.health <= 0) {
            this.health = 0;
            this.is_alive = false;
        }
    },
    
    // Method to heal
    
    heal: function(healing) {
        this.health += healing;
        if (this.health > 100) this.health = 100;
    }
};
