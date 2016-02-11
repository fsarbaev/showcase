<?php

    class Category extends ModelBase{
        public $id;

        public $name;

        public $url;

        public function initialize()
        {
            $this->hasMany("id", "InCategory", "c_id");
        }
    }