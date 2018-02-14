<?php

return [
    'BaseTemplate' => [
        'file' => 'base',
        'description' => '',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description'
            ]
        ],
    'Home' => [
        'file' => 'home',
        'description' => '',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description'
        ]
    ],
    'Catalog' => [
        'file' => 'catalog',
        'description' => '',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description'
        ]
    ],
    'Categories' => [
        'file' => 'categories',
        'description' => '',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
            'image',
            'category_related',
        ]
    ],
    'Category' => [
        'file' => 'category',
        'description' => '',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
            'category_type',
            'image',
            'table_sizes',
            'stylist_choice',
            'category_related',
        ]
    ],
    'Product' => [
        'file' => 'product',
        'description' => '',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
        ]
    ],
    'Articles' => [
        'file' => 'articles',
        'description' => '',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
        ]
    ],
    'Article' => [
        'file' => 'article',
        'description' => '',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
            'image',
            'article_type',
            'article_format',
            'article_products',
            'rating',
        ]
    ],
];