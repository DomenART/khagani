<?php

class AppProductQuickViewProcessor extends modObjectGetProcessor
{
    public $classKey = 'msProduct';
    public $languageTopics = array('minishop2:default');

    public function beforeOutput() {
        $this->object->set('colors', ['gg']);
    }

}

return 'AppProductQuickViewProcessor';