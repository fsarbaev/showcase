<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Your Store</title>
<meta name="description" content="My Store">
<link rel="stylesheet" type="text/css" href="./stylesheet/960.css" media="all">
<link rel="stylesheet" type="text/css" href="./stylesheet/screen.css" media="screen">
<link rel="stylesheet" type="text/css" href="./stylesheet/color.css" media="screen">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="./stylesheet/ie.css" media="screen" />
<![endif]-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript" src="./js/shoppica.js"></script>

<style id="style-1-cropbar-clipper">
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style>

</head>

<body class="s_layout_fixed">

<div id="wrapper">

  <!-- ********************** -->
  <!--      H E A D E R       -->
  <!-- ********************** -->
  <div id="header" class="container_12">
    <div class="grid_12">

    	<a id="site_logo" href="./"></a>


      <div id="categories" class="s_nav">
        <ul>
          <li id="menu_home"> <a href="./">Home</a> </li>

        <?php
         $categorys = Category::find(); ?>
         <?php foreach ($categorys as $category) { ?>
             <?php if ($category->parent_id == null) { ?>
                <li><a href="<?php echo $category->url; ?>"><?php echo $category->name; ?></a>
                    <?php if ($category->child_id != null) { ?>
                         <div class="s_submenu">
                             <?php $subcategory = Category::findFirst("id = ".$category->child_id);?>
                             <h3>Subcategory</h3>
                             <ul class="s_list_1 clearfix">
                                 <li id="menu_26">
                                     <a href="<?php echo $subcategory->url; ?>"><?php echo $subcategory->name; ?></a>
                                 </li>
                             </ul>
                         </div>
                    <?php } ?>
                </li>
             <?php } ?>
         <?php } ?>
         <li><a href="./categories">All categories</a><div class="s_submenu"></div></li>
         <li><a href="./products">All products</a><div class="s_submenu"></div></li>
        </ul>
      </div>



    </div>
  </div>
        <div class="container">
             <?php echo $this->getContent(); ?>
        </div>

<center><p id="copy">©Copyright 2015.</center>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


</div></body></html>