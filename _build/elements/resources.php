<?php

return [
    'web' => [
        'index' => [
            'pagetitle' => 'Главная',
            'longtitle' => 'Khagani_man',
            'description' => 'Магазин мужской деловой одежды',
            'hidemenu' => false,
            'properties' => [
                'template' => 'Home'
            ]
        ],
        'dimensions' => [
            'pagetitle' => 'Таблица размеров',
            'hidemenu' => true,
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'stylist_choice' => [
            'pagetitle' => 'Выбор стилиста',
            'hidemenu' => true,
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'showroom' => [
            'pagetitle' => 'Шоурум',
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'articles' => [
            'pagetitle' => 'Статьи',
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'find-us' => [
            'pagetitle' => 'Как нас найти',
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'contacts' => [
            'pagetitle' => 'Контакты',
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'catalog' => [
            'pagetitle' => 'Каталог',
            'hidemenu' => true,
            'properties' => [
                'template' => 'Catalog'
            ],
            'resources' => [
                'clothes' => [
                    'pagetitle' => 'Одежда',
                    'class_key' => 'msCategory',
                    'properties' => [
                        'template' => 'Categories'
                    ]
                ],
                'shoes' => [
                    'pagetitle' => 'Обувь',
                    'class_key' => 'msCategory',
                    'properties' => [
                        'template' => 'Categories'
                    ]
                ],
                'outerwear' => [
                    'pagetitle' => 'Верхняя одежда',
                    'class_key' => 'msCategory',
                    'properties' => [
                        'template' => 'Categories'
                    ]
                ],
                'accessories' => [
                    'pagetitle' => 'Аксессуары',
                    'class_key' => 'msCategory',
                    'properties' => [
                        'template' => 'Categories'
                    ]
                ]
            ]
        ],
        'service' => [
            'pagetitle' => 'Service',
            'hidemenu' => true,
            'published' => false,
            'resources' => [
                '404' => [
                    'pagetitle' => '404',
                    'hidemenu' => true,
                    'uri' => '404',
                    'uri_override' => true,
                    'properties' => [
                        'template' => 'BaseTemplate'
                    ]
                ],
                'sitemap.xml' => [
                    'pagetitle' => 'Sitemap',
                    'template' => 0,
                    'hidemenu' => true,
                    'uri' => 'sitemap.xml',
                    'uri_override' => true
                ],
            ],
        ],
    ],
];