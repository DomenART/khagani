<!doctype html>
<html lang="en">
<head>
    {include 'file:chunks/_head.tpl'}
</head>

<body>
    <div class="wrapper">
        {include 'file:chunks/_header.tpl'}

        {block 'content'}
            {$_modx->resource.content}
        {/block}

        {include 'file:chunks/_footer.tpl'}
    </div>
</body>
</html>