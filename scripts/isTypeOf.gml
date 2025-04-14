/// isTypeOf(instance id, class id);
/* Checks if an object is, or is an ancestor of, the given class.
 * Returns boolean
*/

var instance = argument0;
var class = argument1;

if (instance.object_index == class)
or (object_is_ancestor(instance.object_index, class)) {
    return true;
}
