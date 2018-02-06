<?php
class AppProductColorUpdateProcessor extends modObjectUpdateProcessor
{
    public $objectType = 'AppProductColor';
    public $classKey = 'AppProductColor';
    public $languageTopics = ['app'];
    //public $permission = 'save';
    /**
     * We doing special check of permission
     * because of our objects is not an instances of modAccessibleObject
     *
     * @return bool|string
     */
    public function beforeSave()
    {
        if (!$this->checkPermissions()) {
            return $this->modx->lexicon('access_denied');
        }
        return true;
    }
    /**
     * @return bool
     */
    public function beforeSet()
    {
        $id = (int)$this->getProperty('id');
        if (empty($id)) {
            return $this->modx->lexicon('app_product_color_err_ns');
        }
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
return 'AppProductColorUpdateProcessor';