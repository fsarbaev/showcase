<div id="content" class="container_12">
    <p>Sort by:
        <a onclick="sortByName()">name</a> ||
        <a onclick="sortByPrice()">price</a>
    <p><div id="cont">{{ message }}</div></p>
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
                    <a class="btn btn-default" onclick="changePage(1)"><i class="icon-fast-backward"></i> First</a>
                    <a class="btn btn-default" onclick="changePage({{ page.before }})"><i class="icon-step-backward"></i> < </a>
                {% endif %}
                {% if page.current != page.total_pages %}
                    <a class="btn btn-default" onclick= "changePage({{ page.next }})"> <i class="icon-step-forward"></i> ></a>
                    <a class="btn btn-default" onclick="changePage({{ page.last }})">Last</a>
                {% endif %}
                <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
            </div>
        </div>

        <div class="clear"></div>
        <br>

        <br>

    </div>
</div>