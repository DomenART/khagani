<?php

return [
    'seo.title' => array(
        'type' => 'textfield',
        'caption' => 'Заголовок',
        'rank' => 10,
        'category' => 'SEO'
    ),
    'seo.keywords' => array(
        'type' => 'textfield',
        'caption' => 'Ключевые слова',
        'rank' => 20,
        'category' => 'SEO'
    ),
    'seo.description' => array(
        'type' => 'textarea',
        'caption' => 'Описание',
        'rank' => 30,
        'category' => 'SEO'
    ),
    'category_type' => array(
        'type' => 'option',
        'caption' => 'Тип категории',
        'elements' => 'Обычная==||Популярное==1||Распродажа==2',
        'rank' => 10,
        'category' => 'Параметры'
    ),
    'category_type' => array(
        'type' => 'option',
        'caption' => 'Тип категории',
        'elements' => 'Обычная==||Популярное==1||Распродажа==2',
        'rank' => 10,
        'category' => 'Параметры'
    ),
    'table_sizes' => array(
        'type' => 'textfield',
        'caption' => 'Таблица размеров',
        'rank' => 30,
        'category' => 'Параметры'
    ),
    'stylist_choice' => array(
        'type' => 'textfield',
        'caption' => 'Выбор стилиста',
        'rank' => 40,
        'category' => 'Параметры'
    ),
    'image' => array(
        'type' => 'fastuploadtv',
        'caption' => 'Изображение',
        'input_properties' => [
            'path' => 'assets/images/resources/{id}/',
            'prefix' => '',
            'MIME' => '',
            'showValue' => 'Да',
            'showPreview' => 'Да',
            'prefixFilename' => 'Нет',
        ],
        'rank' => 20,
        'category' => 'Параметры'
    ),
    'migx_test' => array(
        'type' => 'migx',
        'caption' => 'migx_test',
        'input_properties' => [
            'configs' => '',
            'formtabs' => '[
            {
                "caption": "Заголовок",
                "fields": [
                {
                    "field": "title",
                    "caption": "Заголовок",
                    "inputTVtype": "text"
                },
                {
                    "field": "image",
                    "caption": "Изображение",
                    "inputTVtype": "image",
                    "sourceFrom": "migx"
                }
                ]
            }
            ]',
            'columns' => '[{
            "header": "Заголовок",
            "dataIndex": "title"
            },{
            "renderer": "this.renderImage",
            "sourceFrom": "migx",
            "header": "Изображение",
            "dataIndex": "image"
            }]',
            'btntext' => '',
            'previewurl' => '',
            'jsonvarkey' => '',
            'autoResourceFolders' => 'false',
        ],
        'rank' => 20,
        'category' => 'Параметры'
    ),
];