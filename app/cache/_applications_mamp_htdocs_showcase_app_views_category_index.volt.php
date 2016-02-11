<div id="intro">
    <div id="intro_wrap">
      <div class="container_12">
        <h1>Categories</h1>
      </div>
    </div>
  </div>
<div id="content" class="container_12">
    <div id="order_history" class="grid_12">

          <div class="s_listing s_grid_view clearfix">

                <?php foreach ($categories as $category) { ?>
                    <?php $products = Product::find("c_id = ".$category->id); ?>
                    <div class="grid_4">
                    <div class="s_order clearfix">
                    <p class="s_id"><span class="s_999">Category name:</span> <span class="s_main_color"><?php echo $category->name; ?></span></p>
                    <span class="clear"></span>
                    <dl class="clearfix">
                    <dt>ID::</dt>
                    <dd><?php echo $category->id; ?></dd>
                    <dt>Count::</dt>
                    <dd> <?php count($products) ?></dd>
                    </dl><span class="clear border_eee">
                    </span><a href="<?php echo $category->url; ?>" class="s_button_1 s_main_color_bgr"><span class="s_text">MORE</span></a><br></div></div>
                <?php } ?>
          </div>

          <div class="clear"></div>
          <br>

          <br>

        </div>
    </div>