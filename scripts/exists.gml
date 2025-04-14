///exists(instance id);

var instance = argument0;

if !(is_undefined(instance)) {
    if (instance > 0) {
        if (instance_exists(instance)) {
            return true;
        }
    }
}
