<?php
$url = 'https://developer.mozilla.org/en-US/';
$search_url = $url . 'search.json?q=';

$query = $argv[1];
$results = array();

function toxml($a = null, $format = 'array') {
    global $results;

    if ($format == 'json'):
        $a = json_decode($a, TRUE);
    endif;

    if (is_null($a) && !empty($results)):
        $a = $results;
    elseif (is_null($a) && empty($results)):
        return false;
    endif;

    $items = new SimpleXMLElement("<items></items>");    // Create new XML element

    foreach ($a as $b):                                // Lop through each object in the array
        $c = $items->addChild('item');                // Add a new 'item' element for each object
        $c_keys = array_keys($b);                        // Grab all the keys for that item
        foreach ($c_keys as $key):                        // For each of those keys
            if ($key == 'uid'):
                $c->addAttribute('uid', $b[$key]);
            elseif ($key == 'arg'):
                $c->addAttribute('arg', $b[$key]);
            elseif ($key == 'valid'):
                if ($b[$key] == 'yes' || $b[$key] == 'no'):
                    $c->addAttribute('valid', $b[$key]);
                endif;
            elseif ($key == 'autocomplete'):
                $c->addAttribute('autocomplete', $b[$key]);
            else:
                $c->$key = $b[$key];
            endif;
        endforeach;
    endforeach;

    return $items->asXML();                                // Return XML string representation of the array

}

$results[] = array(
    'uid' => 'placeholder',
    'title' => 'Go to the website',
    'subtitle' => $url,
    'arg' => $url,
    'icon' => 'icon.png',
    'valid' => 'yes'
);

$curl = curl_init();
curl_setopt_array($curl, array(
    CURLOPT_RETURNTRANSFER => 1,
    CURLOPT_URL => $search_url . $query,
));
$output = curl_exec($curl);
curl_close($curl);
$data = json_decode($output);

$results = array();

if (!empty($data) && $data->count > 0) {
    foreach ($data->documents as $d):
        $results[] = array(
            'uid' => $d->slug,
            'title' => $d->title,
            'subtitle' => strip_tags($d->excerpt),
            'arg' => $d->url,
            'icon' => 'icon.png',
            'valid' => 'yes'
        );
    endforeach;
} else {
    $results[] = array(
        'uid' => 'placeholder',
        'title' => 'No documents were found that matched "'.$query.'".',
        'subtitle' => 'Click to see the results for yourself',
        'arg' => $url . 'search?q=' . $query,
        'icon' => 'icon.png',
        'valid' => 'yes'
    );
}

echo toxml();
