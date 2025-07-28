// Movement (override in child spells if needed)
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Lifetime management
if (lifetime-- <= 0) instance_destroy();