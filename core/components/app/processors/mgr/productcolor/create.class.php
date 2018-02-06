<?php
class AppProductColorCreateProcessor extends modObjectCreateProcessor
{
    public $objectType = 'AppProductColor';
    public $classKey = 'AppProductColor';
    public $languageTopics = ['app'];
    //public $permission = 'create';
    /**
     * @return bool
     */
    public function beforeSet()
    {
        $color = $this->getProperty('color');
        $label = $this->getProperty('label');

        if(!$AppColor = $this->modx->getObject('AppColor', array(
            'color' => $color,
            'label' => $label
        ))) {
            $AppColor = $this->modx->newObject('AppColor');
            $AppColor->fromArray(array(
                'color' => $color,
                'label' => $label
            ));
            $AppColor->save();
        }
        
        $this->setProperty('color_id', $AppColor->get('id'));

        return parent::beforeSet();
    }
}
return 'AppProductColorCreateProcessor';