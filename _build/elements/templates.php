<?php

return [
    'BaseTemplate' => [
        'file' => 'base',
        'description' => 'Base template',
        'properties' => [
            'tmplvars' => [
                'seo.title',
                'seo.keywords',
                'seo.description'
            ]
        ]
    ],
    'Home' => [
        'file' => 'home',
        'properties' => [
            'tmplvars' => [
                'seo.title',
                'seo.keywords',
                'seo.description'
            ]
        ]
    ],
    'Catalog' => [
        'file' => 'catalog',
        'properties' => [
            'tmplvars' => [
                'seo.title',
                'seo.keywords',
                'seo.description'
            ]
        ]
    ],
    'Categories' => [
        'file' => 'categories',
        'properties' => [
            'tmplvars' => [
                'seo.title',
                'seo.keywords',
                'seo.description',
                'image'
            ]
        ]
    ],
    'Category' => [
        'file' => 'category',
        'properties' => [
            'tmplvars' => [
                'seo.title',
                'seo.keywords',
                'seo.description',
                'category_type',
                'image',
                'table_sizes',
                'stylist_choice'
            ]
        ]
    ],
    'Product' => [
        'file' => 'product',
        'properties' => [
            'tmplvars' => [
                'seo.title',
                'seo.keywords',
                'seo.description',
            ]
        ]
    ],
    'Article' => [
        'file' => 'article',
        'properties' => [
            'tmplvars' => [
                'seo.title',
                'seo.keywords',
                'seo.description',
            ]
        ]
    ],
];