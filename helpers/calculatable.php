#!/usr/bin/env php
<?php

/**
 * List all characters that can be created with some arithmetics
 */

$characters = [];

foreach (glob('*.php') as $filename) {
    $characters[] = basename($filename, '.php');
}

foreach ($characters as $a) {
    foreach ($characters as $b) {
        if ($a == $b) {
            continue;
        }

        $calulated = $a ^ $b;

        if (!in_array($calulated, $characters) && ctype_alnum($calulated)) {
            echo "$a ^ $b = $calulated\n";
        }

        $calulated = $a ^ ~$b;

        if (!in_array($calulated, $characters) && ctype_alnum($calulated)) {
            echo "$a ^ ~$b = $calulated\n";
        }

        $calulated = ~$a ^ $b;

        if (!in_array($calulated, $characters) && ctype_alnum($calulated)) {
            echo "~$a ^ $b = $calulated\n";
        }

        $calulated = $a & $b;

        if (!in_array($calulated, $characters) && ctype_alnum($calulated)) {
            echo "$a & $b = $calulated\n";
        }

        $calulated = $a & ~$b;

        if (!in_array($calulated, $characters) && ctype_alnum($calulated)) {
            echo "$a & ~$b = $calulated\n";
        }

        $calulated = ~$a & $b;

        if (!in_array($calulated, $characters) && ctype_alnum($calulated)) {
            echo "~$a & $b = $calulated\n";
        }
    }
}
