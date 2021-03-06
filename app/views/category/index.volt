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

                {% for category in categories %}
                    <?php
                     $rows = $this->modelsManager->executeQuery("SELECT COUNT(*) AS count FROM product p, incategory ic
                                      WHERE ic.c_id = :c_id: AND ic.p_id = p.id",
                                                  array('c_id' => $category->id))->getFirst();
                     ?>
                    <div class="grid_4">
                    <div class="s_order clearfix">
                    <p class="s_id"><span class="s_999">Category name:</span> <span class="s_main_color">{{ category.name }}</span></p>
                    <span class="clear"></span>
                    <dl class="clearfix">
                    <dt>ID::</dt>
                    <dd>{{ category.id }}</dd>
                    <dt>Count::</dt>
                    <dd> {{ rows["count"] }}</dd>
                    </dl><span class="clear border_eee">
                    </span><a href="{{ category.url }}" class="s_button_1 s_main_color_bgr"><span class="s_text">MORE</span></a><br></div></div>
                {% endfor %}
          </div>
          <div class="clear"></div>
          <br>

          <br>

        </div>
    </div>