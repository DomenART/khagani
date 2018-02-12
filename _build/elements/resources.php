<?php

return [
    'web' => [
        'index' => [
            'pagetitle' => 'Главная',
            'longtitle' => 'Khagani_man',
            'description' => 'Магазин мужской деловой одежды',
            'hidemenu' => false,
            '_template' => 'Home',
        ],
        'dimensions' => [
            'pagetitle' => 'Таблица размеров',
            'hidemenu' => true,
            '_template' => 'BaseTemplate'
        ],
        'stylist-choice' => [
            'pagetitle' => 'Выбор стилиста',
            'hidemenu' => true,
            '_template' => 'BaseTemplate'
        ],
        'additional' => [
            'pagetitle' => 'Дополнительные услуги',
            'hidemenu' => true,
            '_template' => 'BaseTemplate'
        ],
        'about' => [
            'pagetitle' => 'О компании',
            'hidemenu' => true,
            '_template' => 'BaseTemplate'
        ],
        'news' => [
            'pagetitle' => 'Новости',
            'hidemenu' => true,
            'class_key' => 'TicketsSection',
            '_template' => 'BaseTemplate',
            'properties' => [
                'tickets' => [
                    'template' => 'Article',
                    'uri' => '%alias%ext',
                    'show_in_tree' => false,
                    'hidemenu' => false,
                    'disable_jevix' => true,
                    'process_tags' => true,
                ]
            ],
            'resources' => [
                'news-1' => [
                    'pagetitle' => 'Новость 1',
                    'class_key' => 'Ticket',
                    'show_in_tree' => false,
                    '_template' => 'Article',
                ],
                'news-2' => [
                    'pagetitle' => 'Новость 2',
                    'class_key' => 'Ticket',
                    'show_in_tree' => false,
                    '_template' => 'Article',
                ]
            ]
        ],
        'terms-of-use' => [
            'pagetitle' => 'Пользовательское соглашение',
            'hidemenu' => true,
            '_template' => 'BaseTemplate'
        ],
        'privacy-policy' => [
            'pagetitle' => 'Политика обработки персональных данных',
            'hidemenu' => true,
            '_template' => 'BaseTemplate'
        ],
        'showroom' => [
            'pagetitle' => 'Шоурум',
            '_template' => 'BaseTemplate'
        ],
        'articles' => [
            'pagetitle' => 'Статьи',
            '_template' => 'BaseTemplate'
        ],
        'find-us' => [
            'pagetitle' => 'Как нас найти',
            '_template' => 'BaseTemplate'
        ],
        'contacts' => [
            'pagetitle' => 'Контакты',
            '_template' => 'BaseTemplate'
        ],
        'catalog' => [
            'pagetitle' => 'Каталог',
            'hidemenu' => true,
            '_template' => 'Catalog',
            'resources' => [
                'clothes' => [
                    'pagetitle' => 'Одежда',
                    'class_key' => 'msCategory',
                    '_template' => 'Categories',
                    'resources' => [
                        'popular' => [
                            'pagetitle' => 'Популярное',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                        ],
                        'costumes' => [
                            'pagetitle' => 'Костюмы',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                            'resources' => [
                                'business' => [
                                    'pagetitle' => 'Деловые костюмы',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'wedding' => [
                                    'pagetitle' => 'Свадебные костюмы',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'category1' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'category2' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'category3' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'category4' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                            ]
                        ],
                        'shirts' => [
                            'pagetitle' => 'Рубашки',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                            'resources' => [
                                'business' => [
                                    'pagetitle' => 'Деловые рубашки',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'wedding' => [
                                    'pagetitle' => 'Свадебные рубашки',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                            ]
                        ],
                        'jackets' => [
                            'pagetitle' => 'Пиджаки',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                            'resources' => [
                                'business' => [
                                    'pagetitle' => 'Деловые пиджаки',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'wedding' => [
                                    'pagetitle' => 'Свадебные пиджаки',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'category1' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'category2' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'category3' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'category4' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                            ]
                        ],
                        'pants' => [
                            'pagetitle' => 'Брюки',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                            'resources' => [
                                'business' => [
                                    'pagetitle' => 'Деловые брюки',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                                'wedding' => [
                                    'pagetitle' => 'Свадебные брюки',
                                    'class_key' => 'msCategory',
                                    '_template' => 'Category',
                                ],
                            ]
                        ],
                        'sale' => [
                            'pagetitle' => 'Распродажа',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                        ],
                    ]
                ],
                'footwear' => [
                    'pagetitle' => 'Обувь',
                    'class_key' => 'msCategory',
                    '_template' => 'Categories',
                    'resources' => [
                        'shoes' => [
                            'pagetitle' => 'Туфли',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                        ],
                        'moccasins' => [
                            'pagetitle' => 'Мокасины',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                        ]
                    ]
                ],
                'outerwear' => [
                    'pagetitle' => 'Верхняя одежда',
                    'class_key' => 'msCategory',
                    '_template' => 'Categories',
                    'resources' => [
                        'coat' => [
                            'pagetitle' => 'Пальто',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                        ]
                    ]
                ],
                'accessories' => [
                    'pagetitle' => 'Аксессуары',
                    'class_key' => 'msCategory',
                    '_template' => 'Categories',
                    'resources' => [
                        'ties' => [
                            'pagetitle' => 'Галстуки',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                        ],
                        'butterflies' => [
                            'pagetitle' => 'Бабочки',
                            'class_key' => 'msCategory',
                            '_template' => 'Category',
                        ]
                    ]
                ],
            ]
        ],
        'sitemap' => [
            'pagetitle' => 'Карта сайта',
            'hidemenu' => true,
            '_template' => 'BaseTemplate'
        ],
        'search' => [
            'pagetitle' => 'Поиск',
            'hidemenu' => true,
            '_template' => 'BaseTemplate'
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
                    '_template' => 'BaseTemplate',
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