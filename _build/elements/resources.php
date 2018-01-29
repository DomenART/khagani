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
        'stylist-choice' => [
            'pagetitle' => 'Выбор стилиста',
            'hidemenu' => true,
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'additional' => [
            'pagetitle' => 'Дополнительные услуги',
            'hidemenu' => true,
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'about' => [
            'pagetitle' => 'О компании',
            'hidemenu' => true,
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'news' => [
            'pagetitle' => 'Новости',
            'hidemenu' => true,
            'class_key' => 'TicketsSection',
            'properties' => [
                'template' => 'BaseTemplate',
                'tickets' => [
                    'template' => 'Article',
                    'uri' => '%alias%ext',
                    'disable_jevix' => true,
                    'process_tags' => true,
                ]
            ],
            'resources' => [
                'news-1' => [
                    'pagetitle' => 'Новость 1',
                    'class_key' => 'Ticket',
                    'properties' => [
                        'template' => 'Article'
                    ],
                ],
                'news-2' => [
                    'pagetitle' => 'Новость 2',
                    'class_key' => 'Ticket',
                    'properties' => [
                        'template' => 'Article'
                    ],
                ]
            ]
        ],
        'terms-of-use' => [
            'pagetitle' => 'Пользовательское соглашение',
            'hidemenu' => true,
            'properties' => [
                'template' => 'BaseTemplate'
            ]
        ],
        'privacy-policy' => [
            'pagetitle' => 'Политика обработки персональных данных',
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
                    ],
                    'resources' => [
                        'popular' => [
                            'pagetitle' => 'Популярное',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                        ],
                        'costumes' => [
                            'pagetitle' => 'Костюмы',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                            'resources' => [
                                'business' => [
                                    'pagetitle' => 'Деловые костюмы',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'wedding' => [
                                    'pagetitle' => 'Свадебные костюмы',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'category1' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'category2' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'category3' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'category4' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                            ]
                        ],
                        'shirts' => [
                            'pagetitle' => 'Рубашки',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                            'resources' => [
                                'business' => [
                                    'pagetitle' => 'Деловые рубашки',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'wedding' => [
                                    'pagetitle' => 'Свадебные рубашки',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                            ]
                        ],
                        'jackets' => [
                            'pagetitle' => 'Пиджаки',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                            'resources' => [
                                'business' => [
                                    'pagetitle' => 'Деловые пиджаки',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'wedding' => [
                                    'pagetitle' => 'Свадебные пиджаки',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'category1' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'category2' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'category3' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'category4' => [
                                    'pagetitle' => 'Название категории',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                            ]
                        ],
                        'pants' => [
                            'pagetitle' => 'Брюки',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                            'resources' => [
                                'business' => [
                                    'pagetitle' => 'Деловые брюки',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                                'wedding' => [
                                    'pagetitle' => 'Свадебные брюки',
                                    'class_key' => 'msCategory',
                                    'properties' => [
                                        'template' => 'Category'
                                    ],
                                ],
                            ]
                        ],
                        'sale' => [
                            'pagetitle' => 'Распродажа',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                        ],
                    ]
                ],
                'footwear' => [
                    'pagetitle' => 'Обувь',
                    'class_key' => 'msCategory',
                    'properties' => [
                        'template' => 'Categories'
                    ],
                    'resources' => [
                        'shoes' => [
                            'pagetitle' => 'Туфли',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                        ],
                        'moccasins' => [
                            'pagetitle' => 'Мокасины',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                        ]
                    ]
                ],
                'outerwear' => [
                    'pagetitle' => 'Верхняя одежда',
                    'class_key' => 'msCategory',
                    'properties' => [
                        'template' => 'Categories'
                    ],
                    'resources' => [
                        'coat' => [
                            'pagetitle' => 'Пальто',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                        ]
                    ]
                ],
                'accessories' => [
                    'pagetitle' => 'Аксессуары',
                    'class_key' => 'msCategory',
                    'properties' => [
                        'template' => 'Categories'
                    ],
                    'resources' => [
                        'ties' => [
                            'pagetitle' => 'Галстуки',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                        ],
                        'butterflies' => [
                            'pagetitle' => 'Бабочки',
                            'class_key' => 'msCategory',
                            'properties' => [
                                'template' => 'Category'
                            ],
                        ]
                    ]
                ],
            ]
        ],
        'sitemap' => [
            'pagetitle' => 'Карта сайта',
            'hidemenu' => true
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