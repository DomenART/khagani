<?php

class AppProductQuickViewProcessor extends modObjectGetProcessor
{
    public $classKey = 'msProduct';
    public $languageTopics = array('minishop2:default');
    public $permission = 'save';

    public function beforeOutput() {
        $q = $this->modx->newQuery('AppProductColor');
        $q->innerJoin('AppColor','AppColor', 'AppColor.id = AppProductColor.color_id'); 
        $q->leftJoin('msProductFile','Image', 'Image.id = AppProductColor.product_file_id'); 
        $q->leftJoin('msProductFile','Thumb', 'Thumb.parent = Image.id'); 
        $q->where(array(
            'AppProductColor.product_id' => $this->object->id
        ));
        $q->select('AppProductColor.id,AppColor.label,AppColor.color,Image.url as image,Thumb.url as thumb');
        if ($q->prepare() && $q->stmt->execute()) {
            $colors = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
            $this->object->set('colors', $colors);
        }
    }

}

return 'AppProductQuickViewProcessor';