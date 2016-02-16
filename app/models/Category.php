<?php

    class Category extends ModelBase{
        public $id;

        public $name;

        public $url;

        public $parent_id;

        public $child_id;

        public function initialize()
        {
            $this->hasMany("id", "InCategory", "c_id");
        }
    }