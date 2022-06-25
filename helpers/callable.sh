#!/usr/bin/env sh

# List all functions that can be called based on the files in the current
# working directory. For example, this script assumes that A.php can output
# an "A", and if a method exists a() it will be listed.

regex="^["
for f in $(ls -1 *.php); do
	regex="${regex}$(basename $f .php)"
done
regex="${regex}_:-]\+\$"

# Functions
echo "With the current implementations, you can call the following functions:"
php -r 'foreach (get_defined_functions() as $group) { foreach ($group as $function) { echo "$function\n"; } }' | grep -i "$regex"

# Constants
echo "With the current implementations, you can use the following constants:"
php -r 'foreach (get_defined_constants() as $constant => $value) { echo "$constant (value: $value)\n"; }' | grep -i "$regex"

# Magic constants
echo "With the current implementations, you can use the following magic constants:"
echo "__LINE__\n__FILE_\n__DIR__\n__FUNCTION__\n__CLASS__\n__TRAIT__\n__METHOD__\n__NAMESPACE__\n" | grep -i "$regex"
