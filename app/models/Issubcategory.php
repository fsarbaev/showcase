<?php

class InCategory extends ModelBase{
    public $id;

    public $parent_id;

    public $child_id;

    public function getSource()
    {
        return "issubcategory";
    }


    public function initialize()
    {
        $this->belongsTo("child_id", "Category", "id");
        $this->belongsTo("parent_id", "Category", "id");
    }
}