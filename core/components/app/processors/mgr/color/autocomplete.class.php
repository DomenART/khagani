<?php

class AppColorAutocompleteProcessor extends modObjectProcessor
{
    public $classKey = 'AppColor';
    public $languageTopics = array('app');


    /**
     * @return array|string
     */
    public function process()
    {
        $name = trim($this->getProperty('name'));
        $query = trim($this->getProperty('query'));

        $res = array();
        $c = $this->modx->newQuery($this->classKey);
        $c->sortby($name, 'ASC');
        $c->select($this->modx->getSelectColumns($this->classKey,$this->classKey));
        $c->groupby($name);
        if (!empty($query)) {
            $c->where("{$name} LIKE '%{$query}%'");
        }
        $found = 0;
        if ($c->prepare() && $c->stmt->execute()) {
            $res = $c->stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($res as $k => $v) {
                if ($v[$name] == '') {
                    unset($res[$k]);
                }
                elseif ($v[$name] == $query) {
                    $found = 1;
                }
            }
        }
        if (!$found && !empty($query)) {
            $res = array_merge_recursive(array(array($name => $query)), $res);
        }

        return $this->outputArray($res);
    }

}

return 'AppColorAutocompleteProcessor';