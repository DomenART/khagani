<!doctype html>
<html lang="en">
<head>
    {include 'file:chunks/_head.tpl'}
</head>

<body>
    <div class="wrapper">
        {include 'file:chunks/_header.tpl'}

        {block 'content'}
            <div class="section-twilight">
                <div class="uk-container">
                    {'pdoCrumbs' | snippet : [
                        'showHome' => true,
                        'tplWrapper' => '@INLINE <div class="page-breadcrumb"><ul class="breadcrumb">{$output}</ul></div>',
                        'tplCurrent' => '@INLINE <li><span>{$menutitle}</span></li>'
                    ]}
            
                    <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
                    
                    {$_modx->resource.content}
                </div>
            </div>
        {/block}

        {include 'file:chunks/_footer.tpl'}
    </div>
</body>
</html>