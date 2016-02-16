<div id="intro">
    <div id="intro_wrap">
      <div class="container_12">
        <h1>Products</h1>
      </div>
    </div>
  </div>
<div id="content" class="container_12">
    <p>Sort by:
        <a onclick="sortByName('{{ url()~"product" }}')">name</a> ||
        <a onclick="sortByPrice('{{ url()~"product" }}')">price</a>
    <div id="order_history" class="grid_12">

          <div class="s_listing s_grid_view clearfix">
                {% for product in page.items %}
                    <?php
                        $category = Category::findFirst($product->c_id);
                    ?>
                    <div class="grid_4">
                    <div class="s_order clearfix">
                    <p class="s_id"><span class="s_999">Product name:</span> <span class="s_main_color">{{ product.name }}</span></p>
                    <span class="clear"></span>
                    <dl class="clearfix">
                    <dt>ID::</dt>
                    <dd>{{ product.id }}</dd>
                    <dt>Category::</dt>
                    <dd>{{ category.name }}</dd>
                    <dt>Price::</dt>
                    <dd>{{ product.price }}</dd>
                    </dl><span class="clear border_eee">
                    </span><a href="{{ product.url }}" class="s_button_1 s_main_color_bgr"><span class="s_text">MORE</span></a><br></div></div>
                {% endfor %}
          </div>

        <div class="pagination">
            <div class="links">
                {% if page.current != 1 %}
                    <a class="btn btn-default" onclick="changePage(1, '{{ url()~"product" }}')"><i class="icon-fast-backward"></i> First</a>
                    <a class="btn btn-default" onclick="changePage({{ page.before }}, '{{ url()~"product" }}')"><i class="icon-step-backward"></i> < </a>
                {% endif %}
                {% if page.current != page.total_pages %}
                    <a class="btn btn-default" onclick= "changePage({{ page.next }}, '{{ url()~"product" }}')"> <i class="icon-step-forward"></i> ></a>
                    <a class="btn btn-default" onclick="changePage({{ page.last }}, '{{ url()~"product" }}')">Last</a>
                {% endif %}
                <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
            </div>
        </div>

          <div class="clear"></div>
          <br>

          <br>

        </div>
    </div>