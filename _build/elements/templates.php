<?php

return [
    'BaseTemplate' => [
        'file' => 'base',
        'description' => 'Base template',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description'
        ]
    ],
    'Home' => [
        'file' => 'home',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description'
        ]
    ],
    'Catalog' => [
        'file' => 'catalog',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description'
        ]
    ],
    'Categories' => [
        'file' => 'categories',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
            'image'
        ]
    ],
    'Category' => [
        'file' => 'category',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
            'category_type',
            'image',
            'table_sizes',
            'stylist_choice'
        ]
    ],
    'Product' => [
        'file' => 'product',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
        ]
    ],
    'Article' => [
        'file' => 'article',
        '_tmplvars' => [
            'seo.title',
            'seo.keywords',
            'seo.description',
        ]
    ],
];