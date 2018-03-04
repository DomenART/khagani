<item turbo="true">
    <link>{$id | url : ['scheme' => 'full']}</link>
    <category>{$parent | resource : 'pagetitle'}</category>
    <pubDate>{$publishedon | date : 'r'}</pubDate>
    <description>{$introtext | cdata}</description>
    <turbo:content>
        <![CDATA[
            <header>
                <h1>{$longtitle ?: $pagetitle}</h1>
            </header>
            {if $image?}
            <figure>
                <img src="{'site_url' | config}{$image}" />
                <figcaption>{$description}</figcaption>
            </figure>
            {/if}
            {$content | addUrlToImages}
        ]]>
    </turbo:content>
</item>