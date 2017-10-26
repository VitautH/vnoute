<div class="box category">
        <!-- <div class="box-heading"><h3><?php echo $heading_title; ?></h3></div> -->

    <div class="box-heading"><h3>Категории</h3></div>
    <div class="box-content">
        <div class="box-category">
            <ul class="list-unstyled category_menu">
                <?php $count = 1; ?>
                <?php foreach ($categories as $category) { ?>
                    <?php if ($category['children']) { ?>
                        <li>
                            <a class="children" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']))) as $children) { ?>
                                <ul class="menu-row">
                                    <?php foreach ($children as $child) { ?>
                                        <li>
                                            <img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" />
                                            <b><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></b>
                                            <?php if ($child['subchildren']) { ?>
                                                <ul>
                                                    <?php foreach ($child['subchildren'] as $subchild) { ?>
                                                        <li><a href="<?php echo $subchild['href']; ?>"> - <?php echo $subchild['name']; ?></a></li>
                                                    <?php } ?>
                                                </ul>
                                            <?php } ?>
                                        </li>
                                        <?php $count++ ?>
                                    <?php } ?>
                                </ul>
                            <?php } ?>
                        </li>
                    <?php } else { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php } ?>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>
<!--<script>
jQuery(document).ready(function(){
jQuery('.box-category .menu').find('li>ul').before('<i class="fa fa-plus"></i>');
  jQuery('.box-category .menu li i').on("click", function(){
   if (jQuery(this).hasClass('fa-minus')) { jQuery(this).removeClass('fa-minus').parent('li').find('> ul').slideToggle(); } 
        else {
         jQuery(this).addClass('fa-minus').parent('li').find('> ul').slideToggle();
        }
  });
});
</script>-->
