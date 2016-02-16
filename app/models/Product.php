<?php

    class Product extends ModelBase{
        public $id;

        public $c_id;

        public $name;

        public $price;

        public $url;

        public $image;

        public $description;

        public function initialize()
        {
            $this->hasMany("id", "InCategory", "p_id");
        }
    }