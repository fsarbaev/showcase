<div id="intro">
    <div id="intro_wrap">
      <div class="container_12">
        <h1><?php echo ucfirst($cat_name);?></h1>
      </div>
    </div>
  </div>

<div id="content" class="container_12">
    <div id="category" class="grid_12">
          <div class="clear"></div>
          <div class="s_listing s_grid_view clearfix">
            <?php
            $counter = 0;
            $this_category = Category::findFirst("name = '".$cat_name."'");
            $products = Product::find("c_id=".$this_category->id);
            for($i = 0 + (9 * ($page-1)); $i < (9 + (9 * ($page - 1))) && ($i < count($products)); $i++){
                $product = $products[$i];
                if($counter == 3){
                    echo '<div class="clear" style="opacity: 1;"></div>';
                    $counter = 0;
                }
                echo '<div class="s_item grid_3" style="opacity: 1;"> <a class="s_thumb" href="'.$product->url.'"><img src="'.$product->image.'" title="'.$product->name.'" alt="'.$product->name.'"></a>';
                echo '<h3><a href="'.$product->url.'">'.$product->name.'</a></h3>';
                echo '<p class="s_model">'.Category::findFirst($product->c_id)->name.'</p>';
                echo '<p class="s_price"><span class="s_currency s_before">$</span>'.$product->price.'</p>';
                echo '</div>';
                $counter++;
            }

            ?>


            <div class="clear" style="opacity: 1;"></div>

          </div>

          <div class="pagination">
          <?php
            $num_of_page = ceil(count($products)/9);
            echo '<div class="links">';
            if(floor($page/6) > 0){
                echo '<a href="'.$this_category->url.'/1">|&lt;</a>';
                echo '<a href="'.$this_category->url.'/'.($page - 1).'">&lt;</a>';
            }
            for($i = (1 + floor($page/6) * 5); ($i < (6 + $page/6 * 5)) && ($i <= $num_of_page); $i++){
                if($i == $page) echo '<b>'.$i.'</b>';
                else echo '<a href="'.$this_category->url.'/'.$i.'">'.$i.'</a>';
            }
            if($num_of_page > (6 + $page/6 * 5) && ($page != $num_of_page)){
                 echo '<a href="'.$this_category->url.'/'.($page + 1).'">&gt;</a> <a href="'.$this_category->url.'/'.$num_of_page.'">&gt;|</a>';
            }
            echo '</div>';
            ?>

          </div>

    		</div>
    </div>