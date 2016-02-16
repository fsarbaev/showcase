<?php

class InCategory extends ModelBase{
    public $id;

    public $c_id;

    public $p_id;

    public function getSource()
    {
        return "incategory";
    }

    public function initialize()
    {
        $this->belongsTo("c_id", "Category", "id");
        $this->belongsTo("p_id", "Product", "id");
    }
}