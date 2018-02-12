<form action="" method="get">
    <input type="text" name="query" value="{'mse2_query' | placeholder}" />
    <button type="submit">Искать!</button>
</form>

{'!pdoPage' | snippet : [
    'element' => 'mSearch2'
]}

{'page.nav' | placeholder}