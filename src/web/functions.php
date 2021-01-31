<?php
/**
 * The $airports variable contains array of arrays of airports (see airports.php)
 * What can be put instead of placeholder so that function returns the unique first letter of each airport name
 * in alphabetical order
 *
 * Create a PhpUnit test (GetUniqueFirstLettersTest) which will check this behavior
 *
 * @param  array  $airports
 * @return string[]
 */
function getUniqueFirstLetters(array $airports)
{
    $letters = array_map(function($airport) { return $airport['name'][0]; }, $airports );
    $letters = array_unique($letters);
    sort($letters);

    return $letters;
}

function createUrl($param, $val, $page=0) 
{
    $url = '/?';
    $arr = $_GET;

    if ($page === 1) {
        $arr['page'] = 1;
    }

    foreach ($arr as $key => $v) {
        if ($key !== $param) {
            $url = ($url === '/?') ? $url : "${url}&";
            $url = "${url}${key}=${v}";
        }
    }

    $url = ($url === '/?') ? $url : "${url}&";
    $url = "${url}${param}=${val}";
    return $url;
}