    <div id="content" class="container_12">
    <div id="latest_home" class="grid_12">
          <h2 class="s_title_1"><span class="s_main_color">Latest</span> Products</h2>
          <div class="clear"></div>
          <div class="s_listing s_grid_view clearfix">

                           {% for product in products %}
                               <div class="s_item grid_2" style="opacity: 0.6;">  <a class="s_thumb" href="{{ product.url }}"><img src="{{ product.image }}" title="{{ product.name }}" alt="{{ product.name }}"></a>
                               <h3><a href="{{ product.url }}">{{ product.name }}</a></h3>
                               <p class="s_model"><?php echo Category::findFirst($product->c_id)->name; ?></p>
                               <p class="s_price"><span class="s_currency s_before">$</span>{{ product.price }}</p>
                               </div>
                           {% endfor %}

            <div class="clear" style="opacity: 0.6;"></div>
          </div>
        </div>
    </div>