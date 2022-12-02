<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'facebook' => [ //change it to any provider
        'client_id' => '3182965715155615',
        'client_secret' => 'a25cd7ce81da45e561215140c748b1ca',
        'redirect' => 'http://127.0.0.1:8000/auth/facebook/callback',
    ],

    'twitter' => [ //change it to any provider
        'client_id' => '9N2mj0QGiqAksD8LiVRVFpQHN',
        'client_secret' => 'slH3yoKuLvQJHBcTgrm0aDaHvNW2ZoWpMOTOkuDSylqBMcCsWI',
        'redirect' => 'http://127.0.0.1:8000/auth/twitter/callback',
    ],

    'google' => [ //change it to any provider
        'client_id' => '119407552396-n2l8hjoj1s7d8qjq6gvkcpag01anlsa2.apps.googleusercontent.com',
        'client_secret' => '0xt5Y5Idw1uIL0bOj0dZF-bY',
        'redirect' => 'http://localhost:800/auth/google/callback',
    ],
];
