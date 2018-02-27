<!doctype html>
<html itemscope itemtype="http://schema.org/WebPage" lang="ru">
<head>
    {include 'file:chunks/_head.tpl'}
    {block 'ogmeta'}{/block}
</head>

<body>
    <div class="wrapper">
        {include 'file:chunks/_header.tpl'}

        {block 'content'}
            <div class="section-twilight">
                <div class="uk-container">
                    <div class="page-breadcrumb">
                        {'pdoCrumbs' | snippet : [
                            'showHome' => true,
                            'tpl' => '@FILE chunks/crumbs/link.tpl',
                            'tplWrapper' => '@FILE chunks/crumbs/wrapper.tpl',
                            'tplCurrent' => '@FILE chunks/crumbs/current.tpl'
                        ]}
                    </div>
            
                    <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
                    
                    {$_modx->resource.content}
                </div>
            </div>
        {/block}

        {include 'file:chunks/_footer.tpl'}
    </div>
</body>
</html>