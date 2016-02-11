<div id="intro">
    <div id="intro_wrap">
      <div class="container_12">
        <h1>Products</h1>
      </div>
    </div>
  </div>
<div id="content" class="container_12">
    <div id="order_history" class="grid_12">

          <div class="s_listing s_grid_view clearfix">
            <?php
                $products = Product::find();
                foreach($products as $product){
                    $category = Category::findFirst($product->c_id);
                    echo '<div class="grid_4">';
                    echo '<div class="s_order clearfix">';
                    echo '<p class="s_id"><span class="s_999">Product name:</span> <span class="s_main_color">'.$product->name.'</span></p>';
                    echo '<span class="clear"></span>';
                    echo '<dl class="clearfix">';
                    echo '<dt>ID::</dt>';
                    echo '<dd>'.$product->id.'</dd>';
                    echo '<dt>Category::</dt>';
                    echo '<dd>'.$category->name.'</dd>';
                    echo '<dt>Price::</dt>';
                    echo '<dd>'.$product->price.'</dd>';
                    echo '</dl><span class="clear border_eee">';
                    echo '</span><a href="'.$product->url.'" class="s_button_1 s_main_color_bgr"><span class="s_text">MORE</span></a><br></div></div>';
                }
            ?>

          </div>

          <div class="clear"></div>
          <br>

          <br>

        </div>
    </div>